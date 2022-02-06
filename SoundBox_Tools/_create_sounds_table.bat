@echo off
echo This script will now prepare the files for using SoundBox

if exist ..\SoundBox goto has_folder
echo Creating the folders...
mkdir ..\SoundBox
mkdir ..\SoundBox\sound
echo You can now put your media files into the subfolders found at World of Warcraft\Interface\Addons\SoundBox
goto end_of_file

:has_folder
echo Creating the file...
echo local LSM = LibStub("LibSharedMedia-3.0")> ..\SoundBox\sounds.lua

echo    SOUNDS
echo.>> ..\SoundBox\sounds.lua
echo -- ---------->> ..\SoundBox\sounds.lua
echo --   SOUNDS>> ..\SoundBox\sounds.lua
echo -- ---------->> ..\SoundBox\sounds.lua
for %%F in (..\SoundBox\sounds\*.*) do (
echo    %%~nF
echo LSM:Register("sound", "|cff00FF96SoundBox|r: %%~nF", [[Interface\Addons\SoundBox\sounds\%%~nxF]]^)>> ..\SoundBox\sounds.lua
)

:end_of_file
pause