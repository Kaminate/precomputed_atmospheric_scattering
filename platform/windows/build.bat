@echo off

set CURDIR=%~dp0
set CMAKEFOLDER=_intermediate

pushd %CMAKEFOLDER%

cmake --build . --config Release

popd

if NOT '%1' == 'NOPAUSE' pause