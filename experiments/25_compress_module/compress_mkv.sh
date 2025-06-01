#!/bin/bash

if ! command -v ffmpeg >/dev/null 2>&1; then
	echo "Command ffmpeg not found, installing"
	sudo apt install ffmpeg -qq
else
	echo "Command ffmpeg found, skipping install"
fi

if [[ $# -ne 1 ]]; then
	echo "Please pass in a single .mkv file to compress."
	exit 1
else
	FILE=$(echo "$1" | cut -d '.' -f 1)
	EXT=$(echo "$1" | cut -d '.' -f 2)
fi

if [[ $EXT == mkv ]]; then
	ffmpeg -i "$1" -c:v libx264 -crf 29 -preset medium -c:a aac -b:a 128k "$FILE--compressed.mp4"
fi
