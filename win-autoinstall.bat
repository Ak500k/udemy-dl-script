@echo off
setlocal

:: Step 1: Download the three files
echo Downloading FFmpeg, N_m3u8DL-RE, and Bento4 SDK...
curl -L -o ffmpeg.zip https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip
curl -L -o N_m3u8DL-RE.zip https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v0.2.1-beta/N_m3u8DL-RE_Beta_win-x64_20240828.zip
curl -L -o bento4.zip https://www.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-641.x86_64-microsoft-win32.zip

:: Step 2: Extract the files
echo Extracting files...
mkdir temp
tar -xf ffmpeg.zip -C temp
tar -xf N_m3u8DL-RE.zip -C temp
tar -xf bento4.zip -C temp

:: Step 3: Rename the extracted directories
echo Renaming extracted directories...
rename temp\ffmpeg-master-latest-win64-gpl ffmpeg
rename temp\N_m3u8DL-RE_Beta_win-x64 N_m3u8DL-RE
rename temp\Bento4-SDK-1-6-0-641.x86_64-microsoft-win32 bento4

:: Step 4: Create new directory named "bin"
echo Creating "bin" directory...
mkdir bin

:: Step 5: Move all renamed directories to "bin"
echo Moving renamed directories to "bin" directory...
xcopy /s /e /y temp\ffmpeg bin\ffmpeg\
xcopy /s /e /y temp\N_m3u8DL-RE bin\N_m3u8DL-RE\
xcopy /s /e /y temp\bento4 bin\bento4\

:: Step 6: Add "bin" directories to the system PATH
echo Adding "ffmpeg", "N_m3u8DL-RE", and "bento4" directories to the system PATH...
set "newPath=%CD%\bin\ffmpeg\bin;%CD%\bin\N_m3u8DL-RE;%CD%\bin\bento4\bin"

:: Append to the system PATH for future sessions
setx PATH "%newPath%;%PATH%"

:: Update the PATH for the current session
set PATH=%newPath%;%PATH%

:: Step 7: Cleanup
echo Cleaning up temporary files...
rmdir /s /q temp
del ffmpeg.zip
del N_m3u8DL-RE.zip
del bento4.zip

echo Done!
pause
