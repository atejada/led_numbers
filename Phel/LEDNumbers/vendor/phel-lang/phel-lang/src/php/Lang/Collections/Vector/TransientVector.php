<?php

declare(strict_types=1);

namespace Phel\Lang\Collections\Vector;

use Phel\Lang\Collections\Exceptions\IndexOutOfBoundsException;
use Phel\Lang\Collections\Exceptions\MethodNotSupportedException;
use Phel\Lang\EqualizerInterface;
use Phel\Lang\HasherInterface;
use RuntimeException;

use function count;

/**
 * @template T
 *
 * @implements TransientVectorInterface<T>
 */
final class TransientVector implements TransientVectorInterface
{
    /**
     * @param int $count The number of elements inside this vector
     * @param int $shift The shift value
     * @param array<array> $root The root node of this vector
     * @param T[] $tail The tail of the vector. This is an optimization
     */
    public function __construct(
        private readonly HasherInterface $hasher,
        private readonly EqualizerInterface $equalizer,
        private int $count,
        private int $shift,
        private array $root,
        private array $tail,
    ) {
    }

    public static function empty(HasherInterface $hasher, EqualizerInterface $equalizer): self
    {
        return new self(
            $hasher,
            $equalizer,
            0,
            self::SHIFT,
            [],
            [],
        );
    }

    public static function fromArray(HasherInterface $hasher, EqualizerInterface $equalizer, array $array): self
    {
        $v = self::empty($hasher, $equalizer);
        foreach ($array as $a) {
            $v->append($a);
        }

        return $v;
    }

    public function count(): int
    {
        return $this->count;
    }

    public function persistent(): PersistentVectorInterface
    {
        return new PersistentVector($this->hasher, $this->equalizer, null, $this->count, $this->shift, $this->root, $this->tail);
    }

    /**
     * @param T $value
     */
    public function append($value): TransientVectorInterface
    {
        if (count($this->tail) < self::BRANCH_FACTOR) {
            // There is room for a new value in the tail.
            $this->tail[] = $value;
            ++$this->count;

            return $this;
        }

        // Tail if full, push into tree
        $tailNode = $this->tail;
        $newShift = $this->shift;
        if ($this->count >> self::SHIFT > (1 << $this->shift)) {
            // overflow root
            $newRoot = [$this->root, $this->newPath($this->shift, $tailNode)];
            $newShift += self::SHIFT;
        } else {
            $newRoot = $this->pushTail($this->shift, $this->root, $tailNode);
        }

        ++$this->count;
        $this->shift = $newShift;
        $this->root = $newRoot;
        $this->tail = [$value];

        return $this;
    }

    /**
     * @param T $value
     */
    public function update(int $i, $value): TransientVectorInterface
    {
        if ($i >= 0 && $i < $this->count) {
            if ($i >= $this->tailOffset()) {
                $this->tail[$i & self::INDEX_MASK] = $value;
                return $this;
            }

            $this->root = $this->doUpdate($this->shift, $this->root, $i, $value);
            return $this;
        }

        if ($i === $this->count) {
            return $this->append($value);
        }

        throw new IndexOutOfBoundsException('Index out of bounds');
    }

    /**
     * @return T
     */
    public function get(int $i)
    {
        $arr = $this->getArrayForIndex($i);
        return $arr[$i & self::INDEX_MASK];
    }

    public function pop(): TransientVectorInterface
    {
        if ($this->count === 0) {
            throw new RuntimeException("Can't pop on empty vector");
        }

        if ($this->count === 1) {
            $this->count = 0;
            return $this;
        }

        $i = $this->count - 1;

        if (($i & self::INDEX_MASK) > 1) {
            --$this->count;
            return $this;
        }

        $newTail = $this->getArrayForIndex($this->count - 2);

        $newRoot = $this->popTail($this->shift, $this->root);
        $newShift = $this->shift;
        if ($newRoot === null) {
            $newRoot = [];
        }

        if ($this->shift > self::SHIFT && $newRoot[1] === null) {
            $newRoot = $newRoot[0];
            $newShift -= self::SHIFT;
        }

        $this->root = $newRoot;
        $this->shift = $newShift;
        --$this->count;
        $this->tail = $newTail;

        return $this;
    }

    /**
     * @param int $offset
     *
     * @return mixed|null
     */
    public function offsetGet($offset): mixed
    {
        return $this->get($offset);
    }

    /**
     * @param int $offset
     */
    public function offsetExists($offset): bool
    {
        return $offset >= 0 && $offset < $this->count;
    }

    public function offsetSet($offset, $value): void
    {
        throw new MethodNotSupportedException('Method offsetSet is not supported on VectorSequence');
    }

    public function offsetUnset($offset): void
    {
        throw new MethodNotSupportedException('Method offsetUnset is not supported on VectorSequence');
    }

    public function contains($key): bool
    {
        return $this->offsetExists($key);
    }

    private function pushTail(int $level, array $parent, array $tailNode): array
    {
        $ret = $parent;

        if ($level === PersistentVectorInterface::SHIFT) {
            $ret[] = $tailNode;
            return $ret;
        }

        $subIndex = $this->count - 1 >> $level & PersistentVectorInterface::INDEX_MASK;
        if (count($parent) > $subIndex) {
            $ret[$subIndex] = $this->pushTail($level - PersistentVectorInterface::SHIFT, $parent[$subIndex], $tailNode);
            return $ret;
        }

        $ret[] = $this->newPath($level - PersistentVectorInterface::SHIFT, $tailNode);

        return $ret;
    }

    private function newPath(int $level, array $node): array
    {
        if ($level === 0) {
            return $node;
        }

        return [$this->newPath($level - self::SHIFT, $node)];
    }

    /**
     * @param T $value
     */
    private function doUpdate(int $level, array $node, int $i, mixed $value): array
    {
        $ret = $node;
        if ($level === 0) {
            $ret[$i & self::INDEX_MASK] = $value;
        } else {
            $subIndex = ($i >> $level) & self::INDEX_MASK;
            $ret[$subIndex] = $this->doUpdate($level - self::SHIFT, $node[$subIndex], $i, $value);
        }

        return $ret;
    }

    private function popTail(int $level, array $node): ?array
    {
        $subIndex = ($this->count - 2 >> $level) & self::INDEX_MASK;
        if ($level > self::SHIFT) {
            $newChild = $this->popTail($level - self::SHIFT, $node[$subIndex]);

            if ($newChild === null && $subIndex === 0) {
                return null;
            }

            $ret = $node;
            $ret[$subIndex] = $newChild;
            return $ret;
        }

        if ($subIndex === 0) {
            return null;
        }

        $ret = $node;
        $ret[$subIndex] = null;

        return $ret;
    }

    /**
     * @return list<T>
     */
    private function getArrayForIndex(int $i): array
    {
        if ($i >= 0 && $i < $this->count) {
            if ($i >= $this->tailOffset()) {
                return $this->tail;
            }

            $node = $this->root;
            for ($level = $this->shift; $level > 0; $level -= self::SHIFT) {
                $node = $node[($i >> $level) & self::INDEX_MASK];
            }

            return $node;
        }

        throw new IndexOutOfBoundsException('Index out of bounds');
    }

    /**
     * Computes the tail offset of this vector based on the count.
     */
    private function tailOffset(): int
    {
        if ($this->count < self::BRANCH_FACTOR) {
            return 0;
        }

        return $this->count - count($this->tail);
    }
}
