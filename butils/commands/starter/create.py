import pathlib
import re
import shutil

import butils

__all__ = ["create"]


def create(name):
    name = name if name else input("enter a blender script name: ")
    original_path = (
        pathlib.Path(butils.get_root("butils"))
        .joinpath("commands")
        .joinpath("starter")
        .joinpath("starter_script.py")
    )
    filename = name + ".py" if not name.endswith(".py") else name
    copy_path = pathlib.Path(filename)

    print(f"creating starter script {filename}...")
    if copy_path.exists():
        overwrite = ask_yes_no(f"{copy_path} exists, overwrite? ")
        if not overwrite:
            return
    shutil.copy(original_path, copy_path)


def ask_yes_no(prompt):
    while True:
        answer = input(prompt).strip().lower()
        if re.fullmatch(r"y(es)?|n(o)?", answer):
            return answer.startswith("y")
