<?php

declare(strict_types=1);

namespace Phel\Printer\TypePrinter;

/**
 * @implements TypePrinterInterface<object>
 */
final class ObjectPrinter implements TypePrinterInterface
{
    /**
     * @param object $form
     */
    public function print(mixed $form): string
    {
        return '<PHP-Object(' . $form::class . ')>';
    }
}
