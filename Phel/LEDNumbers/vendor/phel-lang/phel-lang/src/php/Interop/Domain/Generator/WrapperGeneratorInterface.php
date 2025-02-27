<?php

declare(strict_types=1);

namespace Phel\Interop\Domain\Generator;

use Phel\Interop\Domain\ReadModel\FunctionToExport;
use Phel\Interop\Domain\ReadModel\Wrapper;

interface WrapperGeneratorInterface
{
    /**
     * @param list<FunctionToExport> $functionsToExport
     */
    public function generateCompiledPhp(string $phelNs, array $functionsToExport): Wrapper;
}
