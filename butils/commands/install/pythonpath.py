import pathlib
import sys

__all__ = ["install"]


def install():
    path = get_root()

    # Check root directory in sys.path (PYTHONPATH)
    if str(path) in sys.path:
        print(f"{path} in sys.path.")
        return
    else:
        print(f"{path} not in sys.path.")
        print("checking ~/.bashrc...")

    # Check ~/.bashrc for exported PYTHONPATH
    bashrc = pathlib.Path.home().joinpath(".bashrc")
    line = ""
    for line in bashrc.read_text().splitlines():
        if line.startswith("export PYTHONPATH"):
            if str(path) in line:
                print("found exported PYTHONPATH assignment.")
                print("run source ~/.bashrc or open a new terminal.")
                return

    # If not found, add PYTHONPATH assignment to ~/.bashrc
    print(f"no exported PYTHONPATH assignment found containing {path}.")
    file = bashrc.open("a", encoding="utf-8")
    file.write(f"export PYTHONPATH=$PYTHONPATH:{path}" + "\n")
    print("added exported PYTHONPATH assignment.")
    print("run source ~/.bashrc or open a new terminal.")


# Get root directory
def get_root(dirname="blender-scripting"):
    path = pathlib.Path(__file__)
    parts_slice = path.parts[: path.parts.index(dirname) + 1]
    return path.joinpath(*parts_slice)
