import argparse
import json
import os
import time
from typing import Any

import piexif
from PIL import Image
from PIL.ImageFile import ImageFile


def main():
    argparser = argparse.ArgumentParser()
    argparser.add_argument(
        "input_path", type=str, help="Path to the image file."
    )
    argparser.add_argument(
        "--analyze",
        action="store_true",
        help="Get image attributes and metadata. Skips compression.",
    )
    args = argparser.parse_args()

    input_path: str | os.PathLike = args.input_path
    analyze: bool = args.analyze

    t1 = time.time()
    img: ImageFile = Image.open(input_path)
    head, tail = os.path.split(input_path)
    root, ext = os.path.splitext(tail)
    output_path = f"{os.path.join(head, root)}--compressed{ext}"
    if analyze:
        analyze_image(input_path)
    else:
        print(f"Compressing {input_path}...")
        compress_image(img, output_path)
        compression_factor(input_path, output_path)
        print(f"Done in {round(time.time() - t1, 2)} seconds.")


def compression_factor(input_path, output_path):
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


def compress_image(img: ImageFile, new_file_path: str | os.PathLike):
    img.save(new_file_path, optimize=True)


def get_exif_data(img: ImageFile) -> dict[str, Any]:
    """Get EXIF data for an image loaded with the PIL Image module."""
    exif_data_bytes = img.info.get("exif")
    if exif_data_bytes:
        exif_dict = piexif.load(exif_data_bytes)
    else:
        exif_dict = {}
    return exif_dict


def generate_thumbnail(img, width=200):
    """Generate a PIL Image, resized to the given width."""
    thumbnail = img.copy()
    scale = width / img.width
    thumbnail.thumbnail((round(img.height * scale), round(img.width * scale)))
    return thumbnail


def analyze_image(file_path: str | os.PathLike) -> ImageFile:
    """Print various image properties and metadata to the console."""
    img: ImageFile = Image.open(file_path)
    print(f"{file_path}")
    img.info["Size MiB"] = os.path.getsize(file_path) / (1024 * 1024)
    print(f"size: {img.info['Size MiB']} MiB")
    print(f"width: {img.width}")
    print(f"height: {img.height}")
    print(f"mode: {img.mode}")
    print(f"format: {img.format} - {img.format_description}")
    if "exif" in img.info:
        print(f"exif: {get_exif_data(img)}")
        img.info.pop("exif")
    print(f"info: {json.dumps(img.info, indent=2)}")
    return img


if __name__ == "__main__":
    main()
