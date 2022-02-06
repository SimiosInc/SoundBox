@echo OFF
for %%I in (.) do set folder=%%~nxI
set name=%folder:SoundBox_=%

if exist ..\%folder%\sounds goto has_folder
echo Creating the sounds folder...
mkdir sounds
echo You can now put your audio files into World of Warcraft\Interface\Addons\%folder%\sounds
goto EOF

:has_folder
echo This script will now prepare the files for using SoundBox_%name%

echo Creating the %folder%.toc...
echo ## Interface: 90005> ..\%folder%\%folder%.toc
echo ## Title: ^|cff00FF96SoundBox^|r^|cffffffff: %name%^|r>> ..\%folder%\%folder%.toc
echo ## Notes: Soundpack %name% for the SoundBox Addon>> ..\%folder%\%folder%.toc
echo ## Author: Endouken, Desik>> ..\%folder%\%folder%.toc
echo ## Version: 1.0>> ..\%folder%\%folder%.toc
echo ## SavedVariables: SoundBoxDB>> ..\%folder%\%folder%.toc
echo ## Dependecies: SoundBox>> ..\%folder%\%folder%.toc

echo.>> ..\%folder%\%folder%.toc
echo ..\SoundBox\libs\LibStub\LibStub.lua>> ..\%folder%\%folder%.toc
echo ..\SoundBox\libs\CallbackHandler-1.0\CallbackHandler-1.0.xml>> ..\%folder%\%folder%.toc
echo ..\SoundBox\libs\LibSharedMedia-3.0\lib.xml>> ..\%folder%\%folder%.toc
echo.>> ..\%folder%\%folder%.toc

echo sounds.lua>> ..\%folder%\%folder%.toc

echo Creating the sounds.lua file...
echo local LSM = LibStub("LibSharedMedia-3.0")> sounds.lua

echo    SOUNDS
echo.>> sounds.lua
echo -- ---------->> sounds.lua
echo --   SOUNDS>> sounds.lua
echo -- ---------->> sounds.lua
for %%F in (sounds\*.*) do (
echo    %%~nF
echo LSM:Register("sound", "|cff00FF96SoundBox|r: %%~nF", [[Interface\Addons\%folder%\sounds\%%~nxF]]^)>> sounds.lua
)

:EOF
pause
