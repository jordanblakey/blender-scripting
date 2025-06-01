import bpy
import os
import random


def create_or_open_blend_file() -> None:
    path, file = os.path.split(__file__)
    blend_file = os.path.splitext(file)[0] + ".blend"
    blend_file_path = os.path.join(path, blend_file)
    if os.path.exists(blend_file_path):
        os.remove(blend_file_path)
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(path, blend_file))


def set_workspace() -> None:
    """set the workspace to shading to work on materials"""
    target_workspace = bpy.data.workspaces[bpy.data.workspaces.find("Shading")]
    window = bpy.context.window_manager.windows[0]
    window.workspace = target_workspace


def create_material(name: str = "my_generated_material"):
    material = bpy.data.materials.new(name)
    material.use_nodes = True
    nodes = material.node_tree.nodes
    links = material.node_tree.links

    # set the base bsdf config
    bsdf_node = nodes.get("Principled BSDF")
    bsdf_node.inputs["Base Color"].default_value = [
        random.uniform(0.0, 0.6),
        random.uniform(0.0, 0.6),
        random.uniform(0.0, 0.6),
        1,
    ]
    bsdf_node.inputs["Roughness"].default_value = random.uniform(0.0, 0.5)
    bsdf_node.inputs["Metallic"].default_value = random.uniform(0.5, 1.0)

    # create the color ramp node
    color_ramp_node = nodes.new(type="ShaderNodeValToRGB")
    color_ramp_node.color_ramp.elements[0].position = 0.50
    color_ramp_node.color_ramp.elements[1].position = 0.53
    color_ramp_node.location = (-300, 200)
    links.new(color_ramp_node.outputs["Color"], bsdf_node.inputs["Roughness"])

    # create the noise texture node
    noise_texture_node = material.node_tree.nodes.new(type="ShaderNodeTexNoise")
    noise_texture_node.inputs["Scale"].default_value = random.uniform(1.0, 20.0)
    noise_texture_node.inputs["Detail"].default_value = 3
    noise_texture_node.inputs["Lacunarity"].default_value = 5
    noise_texture_node.location = (-500, 200)
    links.new(noise_texture_node.outputs["Color"], color_ramp_node.inputs["Fac"])

    return material


def add_ico_sphere():
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=5)
    bpy.ops.object.shade_smooth()
    return bpy.context.active_object


def main():
    print("reached start of script")
    create_or_open_blend_file()
    set_workspace()

    material = create_material()
    ico_sphere = add_ico_sphere()
    ico_sphere.data.materials.append(material)

    # bpy.ops.object.camera_add(
    #     location=(6, 0, 6), rotation=(math.pi / 4, 0, math.pi / 2))
    # bpy.data.worlds["World"].node_tree.nodes["Background"].inputs['Strength'].default_value = 3
    print("reached end of script")


main()
