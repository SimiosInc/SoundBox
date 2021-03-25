@echo off
echo This script will now prepare the files for using SoundBox

echo    SOUNDS TABLE
echo local _, sounds = ...>> ..\SoundBox\sounds.lua
echo.>> ..\SoundBox\sounds.lua
echo -- --------------->> ..\SoundBox\sounds.lua
echo --   SOUNDS TABLE>> ..\SoundBox\sounds.lua
echo -- --------------->> ..\SoundBox\sounds.lua
echo.>> ..\SoundBox\sounds.lua
for %%F in (..\SoundBox\sound\*.*) do (
echo       %%~nF
echo    sounds["%%~nF"] = "%%~nF">> ..\SoundBox\sounds.lua
)
:end_of_file
pause