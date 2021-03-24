@echo off

docker run --rm %IMAGE% git --version
if not "%ERRORLEVEL%" == "0" exit /B %ERRORLEVEL%
