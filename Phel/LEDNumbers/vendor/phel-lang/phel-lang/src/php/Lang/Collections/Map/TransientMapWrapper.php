<?php

declare(strict_types=1);

namespace Phel\Lang\Collections\Map;

/**
 * @template K
 * @template V
 *
 * @implements TransientMapInterface<K, V>
 */
final class TransientMapWrapper implements TransientMapInterface
{
    /**
     * @param TransientMapInterface<K, V> $internal
     */
    public function __construct(private TransientMapInterface $internal)
    {
    }

    public function contains($key): bool
    {
        return $this->internal->contains($key);
    }

    public function put($key, $value): self
    {
        $this->internal = $this->internal->put($key, $value);

        return $this;
    }

    public function remove($key): self
    {
        $this->internal = $this->internal->remove($key);

        return $this;
    }

    public function find($key)
    {
        return $this->internal->find($key);
    }

    public function count(): int
    {
        return $this->internal->count();
    }

    public function persistent(): PersistentMapInterface
    {
        return $this->internal->persistent();
    }

    /**
     * @param K $offset
     *
     * @return V|null
     */
    public function offsetGet(mixed $offset): mixed
    {
        return $this->internal->offsetGet($offset);
    }

    /**
     * @param K $offset
     */
    public function offsetExists(mixed $offset): bool
    {
        return $this->internal->offsetExists($offset);
    }

    public function offsetSet($offset, $value): void
    {
        $this->internal->offsetSet($offset, $value);
    }

    public function offsetUnset($offset): void
    {
        $this->internal->offsetUnset($offset);
    }
}
