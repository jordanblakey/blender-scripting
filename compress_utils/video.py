import argparse
import os
import sys
import time
from typing import Generator

import ffmpeg


def main():
    argparser = argparse.ArgumentParser()
    argparser.add_argument(
        "input_path", type=str, help="Path to the video file."
    )
    argparser.add_argument(
        "--crf",
        type=str,
        help="Constant Rate Factor. Determines the target bitrate",
    )
    args = argparser.parse_args()
    argparser.print_help()
    print()

    input_path: str | os.PathLike = args.input_path
    crf = (
        args.crf
        or input("Enter CRF (0 = lossless, 23 = default, 29 = aggressive): ")
        or 29
    )
    compress_video(input_path, crf)


def compress_video(input_path, crf):
    t1 = time.time()
    dirname, file = os.path.split(input_path)
    filename, _ = os.path.splitext(file)
    if not os.path.exists(input_path):
        raise ValueError("Input file does not exist.")

    output_path = os.path.join(dirname, filename + "--compressed.mp4")

    input_stream: ffmpeg.nodes.FilterableStream = ffmpeg.input(input_path)
    output_stream = ffmpeg.output(
        input_stream,
        output_path,
        **{"vcodec": "libx264", "format": "mp4", "crf": crf},
    )
    output_stream.run()
    get_compression_factor(input_path, output_path)
    print(f"Done in {round(time.time() - t1, 2)} seconds.")
    print(f"Output path: {os.path.abspath(output_path)}")


def get_compression_factor(input_path, output_path):
    original_size = os.path.getsize(input_path) / (1024 * 1024)
    compressed_size = os.path.getsize(output_path) / (1024 * 1024)
    compression_factor = 1 - compressed_size / original_size
    print()
    print(f"Output path: {os.path.abspath(output_path)}")
    print(f"Original size: {original_size:.2f} MiB")
    print(f"Compressed size: {compressed_size:.2f} MiB")
    compression_ratio = round(original_size / compressed_size, 2)
    print(f"Compression ratio: {compression_ratio} to 1")
    print(f"Compression factor: {int(compression_factor * 100)}%")


def get_abs_paths(dirpath: str | os.PathLike) -> Generator[str, None, None]:
    """Get absolute paths for all files in a directory."""
    for dirpath, _, filenames in os.walk(dirpath):
        for filename in filenames:
            yield os.path.abspath(os.path.join(dirpath, filename))


if __name__ == "__main__":
    main()
