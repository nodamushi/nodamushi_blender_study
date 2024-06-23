@echo off
setlocal

powershell -NoProfile -ExecutionPolicy Bypass -File init_pyenv.ps1 %*

endlocal