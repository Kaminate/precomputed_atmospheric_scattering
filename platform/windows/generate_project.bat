@echo off

set CURDIR=%~dp0
set CMAKEFOLDER=_intermediate

if exist %CMAKEFOLDER% rmdir %CMAKEFOLDER% /s /q
mkdir %CMAKEFOLDER%

pushd %CMAKEFOLDER%

cmake -G"Visual Studio 17 2022" -A x64 ..

popd

if NOT '%1' == 'NOPAUSE' pause