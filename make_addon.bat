@echo off
setlocal

powershell -NoProfile -ExecutionPolicy Bypass -File make_addon.ps1 %*

endlocal