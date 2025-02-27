<?php

declare(strict_types=1);

namespace Phel\Lang\Collections\Map;

use Phel\Lang\Collections\Exceptions\MethodNotSupportedException;
use Phel\Lang\EqualizerInterface;
use Phel\Lang\HasherInterface;

use function count;

/**
 * @template K
 * @template V
 *
 * @implements TransientMapInterface<K, V>
 */
final class TransientArrayMap implements TransientMapInterface
{
    public function __construct(
        private readonly HasherInterface $hasher,
        private readonly EqualizerInterface $equalizer,
        private array $array,
    ) {
    }

    public static function empty(HasherInterface $hasher, EqualizerInterface $equalizer): self
    {
        return new self($hasher, $equalizer, []);
    }

    public function contains($key): bool
    {
        return $this->findIndex($key) !== false;
    }

    public function put($key, $value): TransientMapInterface
    {
        $index = $this->findIndex($key);

        if ($index !== false && $this->equalizer->equals($this->array[$index + 1], $value)) {
            return $this;
        }

        if ($index === false && $this->count() >= PersistentArrayMap::MAX_SIZE) {
            /** @var TransientHashMap<K, V> $m */
            $m = new TransientHashMap($this->hasher, $this->equalizer, 0, null, false, null);
            for ($i = 0, $cnt = count($this->array); $i < $cnt; $i += 2) {
                $m->put($this->array[$i], $this->array[$i + 1]);
            }

            $m->put($key, $value);

            return $m;
        }

        if ($index === false) {
            $this->array[] = $key;
            $this->array[] = $value;
        } else {
            $this->array[$index + 1] = $value;
        }

        return $this;
    }

    public function remove($key): self
    {
        $index = $this->findIndex($key);

        if ($index === false) {
            return $this;
        }

        $newArray = $this->array;
        array_splice($newArray, $index, 2);
        $this->array = $newArray;

        return $this;
    }

    public function find($key)
    {
        $index = $this->findIndex($key);
        if ($index === false) {
            return null;
        }

        return $this->array[$index + 1];
    }

    public function count(): int
    {
        return (int) (count($this->array) / 2);
    }

    /**
     * @param K $offset
     *
     * @return V|null
     */
    public function offsetGet(mixed $offset): mixed
    {
        return $this->find($offset);
    }

    /**
     * @param K $offset
     */
    public function offsetExists(mixed $offset): bool
    {
        return $this->contains($offset);
    }

    public function offsetSet($offset, $value): void
    {
        throw new MethodNotSupportedException('Method offsetSet is not supported on TransientArrayMap');
    }

    public function offsetUnset($offset): void
    {
        throw new MethodNotSupportedException('Method offsetUnset is not supported on TransientArrayMap');
    }

    public function persistent(): PersistentMapInterface
    {
        return new PersistentArrayMap($this->hasher, $this->equalizer, null, $this->array);
    }

    /**
     * @param K $key
     */
    private function findIndex(mixed $key): int|false
    {
        for ($i = 0, $cnt = count($this->array); $i < $cnt; $i += 2) {
            $k = $this->array[$i];
            if ($this->equalizer->equals($k, $key)) {
                return $i;
            }
        }

        return false;
    }
}
