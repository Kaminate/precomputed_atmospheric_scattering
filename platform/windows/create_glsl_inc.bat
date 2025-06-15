@echo off

set SED=%~dp0external\sed\bin\sed.exe
set input=%~1
set output=%~2

REM create output dir
if not exist "%~dp2" md "%~dp2"

REM remove comments
"%SED%" -e "/^\/\*/,/\*\/$/d" -e "/^ *\/\//d" -e "/^$/d" "%input%" > "%output%.tmp0"

REM for each line add quotes \r\n and \ : line -> "{line}\r\n" \
"%SED%" "s/^\(.*\)$/\"\1\\r\\n\"\\/" "%output%.tmp0" > "%output%.tmp1"

REM add variable declaration and ;
echo const char* %~n1_glsl = \> "%output%"
type "%output%.tmp1" >> "%output%"
echo ""; >> "%output%"

