#!/usr/bin/env pwsh
########################################
# Addon Name
$addon=""
########################################
Set-StrictMode -Version Latest
Set-Location -Path (Split-Path -Path $MyInvocation.MyCommand.Path)
if (-not $addon) {
    $addon = Split-Path -Leaf (Get-Location)
}
if (-not (Test-Path -Path $addon -PathType Container)) {
    Write-Error "'$(Get-Location)\$addon' source directory not found."
    exit 1
}
Remove-Item -Path "$addon.zip" -ErrorAction SilentlyContinue
Add-Type -AssemblyName 'System.IO.Compression.FileSystem'
[System.IO.Compression.ZipFile]::CreateFromDirectory($addon, "$addon.zip", [System.IO.Compression.CompressionLevel]::Optimal, $true)

Write-Output "Generate: '$(Get-Location)\$addon.zip'"
