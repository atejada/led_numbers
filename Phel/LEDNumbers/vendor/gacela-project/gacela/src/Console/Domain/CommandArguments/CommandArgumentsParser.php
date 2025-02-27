<?php

declare(strict_types=1);

namespace Gacela\Console\Domain\CommandArguments;

use InvalidArgumentException;

use function count;

final class CommandArgumentsParser implements CommandArgumentsParserInterface
{
    /**
     * @param array{
     *     autoload: array{"psr-4"?:array<string,string>},
     *     autoload-dev?: array{"psr-4"?:array<string,string>},
     * } $composerJson
     */
    public function __construct(
        private array $composerJson,
    ) {
    }

    /**
     * @param string $desiredNamespace The location of the new module. For example: App/TestModule
     *
     * @throws InvalidArgumentException
     */
    public function parse(string $desiredNamespace): CommandArguments
    {
        if (!isset($this->composerJson['autoload'])) {
            throw CommandArgumentsException::noAutoloadFound();
        }

        if (!isset($this->composerJson['autoload']['psr-4'])) {
            throw CommandArgumentsException::noAutoloadPsr4Found();
        }

        $psr4 = $this->composerJson['autoload']['psr-4'];
        $psr4Dev = $this->composerJson['autoload-dev']['psr-4'] ?? [];

        $allPsr4Combinations = $this->allPossiblePsr4Combinations($desiredNamespace);

        foreach ($allPsr4Combinations as $psr4Combination) {
            $psr4Key = $psr4Combination . '\\';

            if (isset($psr4[$psr4Key])) {
                return $this->foundPsr4($psr4Key, $psr4[$psr4Key], $desiredNamespace);
            }

            if (isset($psr4Dev[$psr4Key])) {
                return $this->foundPsr4($psr4Key, $psr4Dev[$psr4Key], $desiredNamespace);
            }
        }

        throw CommandArgumentsException::noAutoloadPsr4MatchFound($desiredNamespace, array_keys($psr4));
    }

    /**
     * Combine all possible psr-4 combinations and return them ordered by longer to shorter.
     * This way we'll be able to find the longer match first.
     * For example: App/TestModule/TestSubModule will produce an array such as:
     * [
     *   'App/TestModule/TestSubModule',
     *   'App/TestModule',
     *   'App',
     * ]
     *
     * @return list<string>
     */
    private function allPossiblePsr4Combinations(string $desiredNamespace): array
    {
        $result = [];

        foreach (explode('/', $desiredNamespace) as $explodedArg) {
            if ($result === []) {
                $result[] = $explodedArg;
            } else {
                $prevValue = $result[count($result) - 1];
                $result[] = $prevValue . '\\' . $explodedArg;
            }
        }

        return array_reverse($result);
    }

    private function foundPsr4(string $psr4Key, string $psr4Value, string $desiredNamespace): CommandArguments
    {
        $rootDir = mb_substr($psr4Value, 0, -1);
        $rootNamespace = mb_substr($psr4Key, 0, -1);
        $targetDirectory = str_replace(['/', $rootNamespace, '\\'], ['\\', $rootDir, '/'], $desiredNamespace);
        $namespace = str_replace([$rootDir, '/'], [$rootNamespace, '\\'], $targetDirectory);

        return new CommandArguments($namespace, $targetDirectory);
    }
}
