<?php

declare(strict_types=1);

namespace Phel\Build\Domain\Compile;

final readonly class CompiledFile
{
    public function __construct(
        private string $sourceFile,
        private string $targetFile,
        private string $namespace,
    ) {
    }

    public function getSourceFile(): string
    {
        return $this->sourceFile;
    }

    public function getTargetFile(): string
    {
        return $this->targetFile;
    }

    public function getNamespace(): string
    {
        return $this->namespace;
    }
}
