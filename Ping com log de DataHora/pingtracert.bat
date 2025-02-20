@echo off
set ip=%1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0ping.ps1" -ip %ip%
