import os

from PIL.ImageFile import ImageFile


def check_compression_performance(img: ImageFile, new_img: ImageFile) -> float:
    """Given to ImageFiles, get the compression factor between them."""
    s1 = img.info["Size MiB"]
    s2 = new_img.info["Size MiB"]

    print(f"Original size: {s1} MiB -> New size: {s2} MiB")
    compression_factor = round(1 - (s1 - s2) / s1, 2)
    compression_ratio = round(1 / compression_factor, 2)
    print(f"Compression ratio: {compression_ratio}")
    print(
        f"Compression factor: {compression_factor} or {compression_factor * 100}%"
    )
    return compression_factor


def compress_image(img: ImageFile, new_file_path: str | os.PathLike):
    img.save(new_file_path, optimize=True)
