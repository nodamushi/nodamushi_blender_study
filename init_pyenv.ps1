#!/usr/bin/env pwsh
param (
    [string]$BLENDER,
    [string]$PYTHON
)

if (-not $BLENDER -or -not $PYTHON) {
    Write-Error "Usage: $($MyInvocation.MyCommand.Name) <Blender Version> <Python Version>"
    exit 1
}

$VENV = ".venv"
$ACTIVATE = if ($env:WINDIR) { "Scripts\Activate" } else { "bin/activate" }

Set-Location -Path (Split-Path -Path $MyInvocation.MyCommand.Path)

if (-not (pyenv versions | Select-String -Pattern "$PYTHON")) {
    Write-Output "Install Python $PYTHON"
    pyenv install "$PYTHON"
}
pyenv local "$PYTHON"

if (-not (Test-Path -Path $VENV)) {
    python -m venv $VENV
    & "$VENV/$ACTIVATE"
    pip install "fake-bpy-module-$BLENDER"
} else {
    & "$VENV/$ACTIVATE"
}

# .vscodeディレクトリを作成
New-Item -ItemType Directory -Path .vscode -Force

# settings.jsonファイルを作成
$settingsJson = @"
{
  "files.exclude": {
    "**/.git": true,
    "**/.DS_Store": true,
    "**/Thumbs.db": true,
    ".venv/": true,
    ".python-version": true
  }
}
"@

$settingsJson | Out-File -FilePath .vscode\settings.json -Encoding UTF8 -Force

Write-Output ""
Write-Output " Run: `& .\$VENV\$ACTIVATE` to activate the virtual environment"
Write-Output ""
