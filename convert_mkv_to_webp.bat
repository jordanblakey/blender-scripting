@echo off
set /p "fps=Enter frame rate (e.g., 30): "
set /p "quality=Enter quality (0-100, e.g., 80): "
set /p "size=Enter horizontal size (e.g., 960): "

:loop
if "%~1"=="" goto end
echo Converting: %~1

ffmpeg -i "%~1" ^
-vf "fps=%fps%,scale=%size%:-1:flags=lanczos,format=gbrp" ^
-vcodec libwebp ^
-lossless 0 ^
-q:v %quality% ^
-compression_level 6 ^
-loop 0 ^
"%~n1.webp"

shift
goto loop

:end
echo Done!
pause