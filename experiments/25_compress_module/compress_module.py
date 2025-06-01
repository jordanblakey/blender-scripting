import os
import sys

import compress_utils
from PIL.ImageFile import ImageFile

# Not importing butils, since it depends on Blender env to work.
# So, it's necessary to import the submodules directly to test them.
sys.path.append(
    os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "butils"))
)

from compress_utils import image  # type: ignore

if (
    "post_process.compress" not in sys.modules
    or "post_process.image" not in sys.modules
):
    raise ImportError()
# Now the modules are available


for fp in os.listdir("images"):
    if "compressed" in fp:
        continue
    print(fp)
    img: ImageFile = compress_utils.image.analyze_image(fp)
    print(img)
    root, ext = os.path.splitext(os.path.split(fp)[-1])

    print(ext)

    new_fp = f"images/{root}-compressed{ext}"
    img.save(new_fp, optimize=True)
    new_img = image.analyze_image(new_fp)
    print(new_img)
    compress_utils.get_compression_factor(img, new_img)
