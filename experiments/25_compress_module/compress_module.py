import os
import sys

from PIL.ImageFile import ImageFile

from butils.commands.compress import image

# Not importing butils, since it depends on Blender env to work.
# So, it's necessary to import the submodules directly to test them.
sys.path.append(
    os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "butils"))
)


if (
    "post_process.compress" not in sys.modules
    or "post_process.image" not in sys.modules
):
    raise ImportError()
# Now the modules are available


for fp in os.listdir("images"):
    if "compressed" in fp:
        continue
    img: ImageFile = image.analyze_image(fp)
    root, ext = os.path.splitext(os.path.split(fp)[-1])

    new_fp = f"images/{root}-compressed{ext}"
    img.save(new_fp, optimize=True)
    new_img = image.analyze_image(new_fp)
    print = image.compression_factor(img, new_img)
