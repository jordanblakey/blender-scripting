# Explore Blender's Preferences Data
# This script explores the Blender preferences data structure and prints out the properties
# Note that preferences are not stored in the currently open blend file.
# Instead, they are stored in a separate file, for example:
# $HOME/.config/blender/4.4/config/userpref.blend

import bpy

# notes that as long as not background mode, preferences context is always available, like wm
print(bpy.context.preferences)


def main():
    # read_preferences_section("inputs")
    print(bpy.context.preferences.bl_rna.properties.keys())
    for prop in bpy.context.preferences.bl_rna.properties.keys():
        if prop in ["rna_type"]:
            continue
        value = getattr(bpy.context.preferences, prop)
        print(f"{prop}: {value}")
        if isinstance(value, bpy.types.bpy_struct):
            read_preferences_section(prop)
        print()


def read_preferences_section(section_name):
    section = getattr(bpy.context.preferences, section_name)
    print(f"Preferences Section: {section_name}")
    for prop in section.bl_rna.properties.keys():
        print(f"{prop}: {getattr(section, prop)}")


if __name__ == "__main__":
    main()


# # open preferences modal
# bpy.ops.screen.userpref_show()

# # install and activate a theme from extensions.blender.org
# # os.popen(
# #     "wget -P /tmp/ https://extensions.blender.org/download/sha256:0e92d3abb99c286dc99e230cb896cfd272eba7a4c88f583f6fb8435ae9ecfbcb/theme-gruvbox-dark-v1.4.0.zip"
# # )
# # os.popen("cd /tmp && unzip theme-gruvbox-dark-v1.4.0.zip")
# # # bpy.ops.preferences.theme_install(filepath="/tmp/Gruvbox_Dark.xml")
# # bpy.ops.preferences.reset_default_theme()

# # modify script directories - Note that this persists across Blender sessions and blend files
# # in other words, this could be a viable alternative to installing py dependencies in blender's user scripts directory
# # instead, just add the site_packages directory from the projects virtual environment
