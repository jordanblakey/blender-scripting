import subprocess


def clip_values(obj):
    """Copy keys and values of obj.dir() to clipboard, omitting __*__ attrs."""
    output = []

    def set_clipboard_data(text):
        p = subprocess.Popen(
            ["xsel", "-b", "-i"], stdin=subprocess.PIPE, encoding="utf-8"
        )
        p.communicate(text)

    for key in dir(obj):
        if not key.startswith("_"):
            line = f"{key}: {type(getattr(obj, key)).__name__} = {getattr(obj, key)}"
            output.append(line)
    set_clipboard_data("\n".join(output))
