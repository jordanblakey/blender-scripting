import json
import os
from typing import Any, Generator

import piexif
from PIL import Image
from PIL.ImageFile import ImageFile


def get_abs_paths(dirpath: str | os.PathLike) -> Generator[str, None, None]:
    """Get absolute paths for all files in a directory."""
    for dirpath, _, filenames in os.walk(dirpath):
        for filename in filenames:
            yield os.path.abspath(os.path.join(dirpath, filename))


def get_exif_data(img: ImageFile) -> dict[str, Any]:
    """Get EXIF data for an image loaded with the PIL Image module."""
    exif_data_bytes = img.info.get("exif")
    if exif_data_bytes:
        exif_dict = piexif.load(exif_data_bytes)
    else:
        exif_dict = {}
    return exif_dict


def get_size_mb(file_path):
    """Get size of a file in MB."""
    return round(os.path.getsize(file_path) / 2**20, 2)


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
    img.info["Size MiB"] = get_size_mb(file_path)
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
