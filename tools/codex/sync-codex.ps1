param(
    [switch]$InstallUserSkills
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Resolve-NormalizedPath {
    param([Parameter(Mandatory = $true)][string]$Path)
    return [System.IO.Path]::GetFullPath((Resolve-Path -LiteralPath $Path).Path)
}

function Assert-WithinRoot {
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$Target
    )

    $normalizedRoot = [System.IO.Path]::GetFullPath($Root).TrimEnd('\') + '\'
    $normalizedTarget = [System.IO.Path]::GetFullPath($Target).TrimEnd('\') + '\'

    if (-not $normalizedTarget.StartsWith($normalizedRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to modify path outside root. Root: $normalizedRoot Target: $normalizedTarget"
    }
}

function Reset-Directory {
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$Target
    )

    Assert-WithinRoot -Root $Root -Target $Target

    if (Test-Path -LiteralPath $Target) {
        Get-ChildItem -LiteralPath $Target -Force | Remove-Item -Recurse -Force
    } else {
        New-Item -ItemType Directory -Path $Target -Force | Out-Null
    }
}

function Copy-SkillDirectories {
    param(
        [Parameter(Mandatory = $true)][string]$SourceSkills,
        [Parameter(Mandatory = $true)][string]$DestinationSkills,
        [Parameter(Mandatory = $true)][string]$SafetyRoot
    )

    Reset-Directory -Root $SafetyRoot -Target $DestinationSkills

    foreach ($skillDir in Get-ChildItem -LiteralPath $SourceSkills -Directory) {
        Copy-Item -LiteralPath $skillDir.FullName -Destination $DestinationSkills -Recurse -Force
    }
}

$repoRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\.."))
$sourceSkills = Join-Path $repoRoot ".claude\skills"
$pluginSkills = Join-Path $repoRoot "plugins\codex-game-studios\skills"

if (-not (Test-Path -LiteralPath $sourceSkills)) {
    throw "Source skills directory not found: $sourceSkills"
}

Copy-SkillDirectories -SourceSkills $sourceSkills -DestinationSkills $pluginSkills -SafetyRoot $repoRoot
$pluginCount = (Get-ChildItem -LiteralPath $pluginSkills -Directory).Count
Write-Host "Synced $pluginCount skills into repo plugin at $pluginSkills"

if ($InstallUserSkills) {
    $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" }
    $userSkills = Join-Path $codexHome "skills"

    if (-not (Test-Path -LiteralPath $userSkills)) {
        New-Item -ItemType Directory -Path $userSkills -Force | Out-Null
    }

    foreach ($skillDir in Get-ChildItem -LiteralPath $sourceSkills -Directory) {
        $targetDir = Join-Path $userSkills $skillDir.Name
        if (Test-Path -LiteralPath $targetDir) {
            Assert-WithinRoot -Root $codexHome -Target $targetDir
            Remove-Item -LiteralPath $targetDir -Recurse -Force
        }
        Copy-Item -LiteralPath $skillDir.FullName -Destination $targetDir -Recurse -Force
    }

    $userCount = (Get-ChildItem -LiteralPath $userSkills -Directory | Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") }).Count
    Write-Host "Installed skills into user Codex directory at $userSkills"
    Write-Host "User skills containing SKILL.md: $userCount"
}

Write-Host "Restart Codex to refresh skill discovery if commands do not appear immediately."
