import colorsys
import math
import os
import sys

import bpy
import bpy.types

import butils

ENGINE = "CYCLES"
RESOLUTION_PERCENTAGE = 200
RENDER_IMAGE = False
RENDER_ANIMATION = False

################################################################################
# Set Up Script
################################################################################

# blender -b -P headless_mode.py  # debug scripts
# blender -P headless_mode.py  # work in UI

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + ".blend"

# Import custom modules
modules_path = os.path.join(dirname, "..")
if modules_path not in sys.path:
    sys.path.append(modules_path)


butils.scene.clean()
butils.blend_file.create_or_open(blend_file)

################################################################################
# Define Script
################################################################################


def main():
    butils.scene.setup_starter_scene(
        background_color=(*colorsys.hls_to_rgb(2 / 3, 0, 1 / 4), 1)
    )
    sun = bpy.data.objects.get("Sun")
    if sun and isinstance(sun.data, bpy.types.SunLight):
        sun.data.angle = math.pi / 18

    # create object
    bpy.ops.mesh.primitive_uv_sphere_add(radius=1)
    object = bpy.context.active_object
    bpy.ops.object.shade_smooth()
    bpy.ops.object.modifier_add(type="SUBSURF")
    if object and isinstance(bpy.context.object, bpy.types.Mesh):
        mod = bpy.context.object.modifiers["Subdivision"]
        if isinstance(mod, bpy.types.SubsurfModifier):
            mod.levels = 2
    material = create_material()

    if object and object.data and isinstance(object.data, bpy.types.Mesh):
        object.data.materials.append(material)

    # preview in viewport
    butils.ui.set_view3d_shading_type("RENDERED")


def create_material():
    # create and apply material
    material = bpy.data.materials.new(name="Material")

    # prepare to use shader editor
    material.use_nodes = True
    if material.node_tree is None:
        raise ValueError("Material node tree is None, cannot create nodes.")
    nodes = material.node_tree.nodes
    links = material.node_tree.links

    # create and position nodes
    principled_bsdf_node = nodes.get("Principled BSDF")
    texture_coordinate_node = nodes.new(type="ShaderNodeTexCoord")
    texture_coordinate_node.location = (-600, 0)
    color_ramp_node = nodes.new(type="ShaderNodeValToRGB")
    color_ramp_node.location = (-300, 0)

    # create links between nodes
    links.new(
        texture_coordinate_node.outputs["Normal"], color_ramp_node.inputs["Fac"]
    )
    if principled_bsdf_node is None:
        raise ValueError("Principled BSDF node not found in material.")
    links.new(
        color_ramp_node.outputs["Color"],
        principled_bsdf_node.inputs["Base Color"],
    )

    if not isinstance(color_ramp_node, bpy.types.ShaderNodeValToRGB):
        raise TypeError(
            "Expected ShaderNodeValToRGB, got {}".format(type(color_ramp_node))
        )
    if not isinstance(color_ramp_node.color_ramp, bpy.types.ColorRamp):
        raise TypeError(
            "Expected ColorRamp, got {}".format(
                type(color_ramp_node.color_ramp)
            )
        )
    # config the color ramp for a twilight gradient
    elements = color_ramp_node.color_ramp.elements
    stop1 = elements[0]
    stop1.position = 0.11
    stop1.color = (0.05, 0.02, 0.20, 1.0)  # Dark Indigo
    stop2 = elements[1]
    stop2.position = 0.32
    stop2.color = (0.40, 0.10, 0.45, 1.0)  # Purple/Magenta
    stop3 = elements.new(position=0.51)
    stop3.color = (0.85, 0.25, 0.10, 1.0)  # Reddish Orange
    stop4 = elements.new(position=0.69)
    stop4.color = (1.00, 0.45, 0.05, 1.0)  # Bright Orange
    stop5 = elements.new(position=1.0)
    stop5.color = (1.00, 0.75, 0.30, 1.0)  # Pale Yellow/Light Orange

    return material


################################################################################
# Run Script, Save .blend File, Render
################################################################################

print("script stage starting...")
main()
print("script stage complete.")

butils.blend_file.save(blend_file)

print("render stage starting...")
butils.render.config_engine(ENGINE, 0, True)

butils.render.config_render_paths(
    cwd=dirname,
    filename="viewport_render",
    resolution_percentage=RESOLUTION_PERCENTAGE,
)
butils.render.render_viewport(
    image_format="PNG",
    resolution_percentage=RESOLUTION_PERCENTAGE,
    shading_type="WIREFRAME",
    view_perspective="ORTHO",
)

butils.render.config_render_paths(
    cwd=dirname,
    filename="cycles_render",
    resolution_percentage=RESOLUTION_PERCENTAGE,
)
butils.render.render_image(resolution_percentage=RESOLUTION_PERCENTAGE)

print("render stage complete.")
