import argparse
import os
import re

import butils.commands


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "action",
        type=str,
        help="An action to perform like: create, compress",
    )
    parser.add_argument(
        "-i",
        "--input-file",
        help="A file to pass into the action, for example an image or video to be compressed.",
    )
    parser.add_argument(
        "--analyze",
        action="store_true",
        help="Get image attributes and metadata. Skips compression.",
    )
    parser.add_argument(
        "--crf",
        type=str,
        help="Constant Rate Factor. Determines the target bitrate",
    )
    args = parser.parse_args()

    if args.action == "create":
        butils.commands.starter.create(name=args.input_file)

    if args.action == "compress":
        if not args.input_file:
            print("no input file")
        else:
            args.input_file = os.path.abspath(args.input_file)
            _, ext = os.path.splitext(args.input_file)
            if re.match(r"\.(mkv|mp4)", ext):
                print(f"Trying video compression for {ext} file.")
                butils.commands.video.compress(args.input_file, crf=args.crf)
            elif re.match(r"\.(png|jpg|jpeg)", ext):
                print(f"Trying image compression for {ext} file.")
                butils.commands.image.compress(
                    args.input_file, analyze=args.analyze
                )
            else:
                print(f"{ext} is not a supported file type.")


if __name__ == "__main__":
    main()
