@echo off
echo This script will now prepare the files for using SoundBox

if exist ..\SoundBox goto has_folder
echo Creating the folders...
mkdir ..\SoundBox
mkdir ..\SoundBox\sound
mkdir ..\SoundBox\img
echo You can now put your media files into the subfolders found at World of Warcraft\Interface\Addons\SoundBox
goto end_of_file

:has_folder
echo Creating the TOC...
echo ## Interface: 90005 > ..\SoundBox\SoundBox.toc
echo ## Title: |cff00FF96SoundBox|r|cffffffff: Don't Let your memes be dreams|r >> ..\SoundBox\SoundBox.toc
echo ## Notes: Play meme sounds, type /sb for help commands >> ..\SoundBox\SoundBox.toc
echo ## Author: Endouken, Desik >> ..\SoundBox\SoundBox.toc
echo ## Version: @project-version@>> ..\SoundBox\SoundBox.toc
echo ## SavedVariables: SoundBoxDB>> ..\SoundBox\SoundBox.toc
echo.>> ..\SoundBox\SoundBox.toc
echo #@no-lib-strip@ >> ..\SoundBox\SoundBox.toc
echo libs\LibStub\LibStub.lua >> ..\SoundBox\SoundBox.toc
echo libs\CallbackHandler-1.0\CallbackHandler-1.0.xml >> ..\SoundBox\SoundBox.toc
echo libs\LibSharedMedia-3.0\lib.xml >> ..\SoundBox\SoundBox.toc
echo #@end-no-lib-strip@ >> ..\SoundBox\SoundBox.toc
echo.>> ..\SoundBox\SoundBox.toc
echo sounds.lua >> ..\SoundBox\SoundBox.toc
echo SharedMedia.lua >> ..\SoundBox\SoundBox.toc
echo main.lua >> ..\SoundBox\SoundBox.toc
echo.>> ..\SoundBox\SoundBox.toc
echo Creating the file...
echo local LSM = LibStub("LibSharedMedia-3.0")> ..\SoundBox\temp.lua

echo    SOUND
echo.>> ..\SoundBox\temp.lua
echo -- ----->> ..\SoundBox\temp.lua
echo --   SOUND>> ..\SoundBox\temp.lua
echo -- ----->> ..\SoundBox\temp.lua
for %%F in (..\SoundBox\sound\*.*) do (
echo       %%~nF
echo LSM:Register("sound", "SoundBox:%%~nF", [[Interface\Addons\SoundBox\sound\%%~nxF]]^)>> ..\SoundBox\temp.lua
)

echo    IMG
echo.>> ..\SoundBox\temp.lua
echo -- ----->> ..\SoundBox\temp.lua
echo --   IMG>> ..\SoundBox\temp.lua
echo -- ----->> ..\SoundBox\temp.lua
for %%F in (..\SoundBox\img\*.*) do (
echo       %%~nF
echo LSM:Register("statusbar", "SoundBox:%%~nF", [[Interface\Addons\SoundBox\img\%%~nxF]]^)>> ..\SoundBox\temp.lua
)

:end_of_file
pause