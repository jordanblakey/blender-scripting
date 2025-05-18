#!/bin/bash

if ! command -v ffmpeg > /dev/null 2>&1; then
  echo "Command ffmpeg not found, installing"
  sudo apt install ffmpeg -qq
else
  echo "Command ffmpeg found, skipping install"
fi

if [[ $# -ne 1 ]]; then
  echo "Please pass in a single .mkv file to compress."
  exit 1
else
  FILE=$(echo $1 | cut -d '.' -f 1)
  EXT=$(echo $1 | cut -d '.' -f 2)
fi

if [[ $EXT == mkv ]]; then
  ffmpeg -i $1 -c:v libx264 -crf 29 -preset medium -c:a aac -b:a 128k $FILE--compressed.mp4
fi


# TODO: Create post_process module function to compress .mkv files

# import ffmpeg

# def compress_mkv(input_path, output_path, crf=23):
#     """
#     Compresses an MKV video file using FFmpeg with a specified CRF value.

#     Args:
#         input_path (str): Path to the input MKV file.
#         output_path (str): Path to save the compressed MKV file.
#         crf (int, optional): Constant Rate Factor (CRF) value.
#                               Lower values mean higher quality, larger file size.
#                               Higher values mean lower quality, smaller file size.
#                               Defaults to 23.
#     """
#     try:
#         ffmpeg.input(input_path).output(output_path, vcodec='libx264', crf=crf).run()
#         print(f"Video compressed successfully. Output saved to {output_path}")
#     except ffmpeg.Error as e:
#         print(f"Error compressing video: {e.stderr.decode()}")

# # Example usage:
# input_file = 'input.mkv'
# output_file = 'output_compressed.mkv'
# compress_mkv(input_file, output_file, crf=28) # Adjust CRF as needed