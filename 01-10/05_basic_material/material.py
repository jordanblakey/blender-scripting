import bpy
import random


def set_viewports_mode(mode='RENDERED'):
    """
    Sets the shading type of all 3D Viewports in all windows to 'RENDERED'.
    """
    for window in bpy.context.window_manager.windows:
        screen = window.screen
        for area in screen.areas:
            if area.type == 'VIEW_3D':
                for space in area.spaces:
                    if space.type == 'VIEW_3D':
                        space.shading.type = mode
                        print(
                            f"Set viewport in area '{area.ui_type}' to RENDERED")
                        break  # Only need to set it once per area


def clean_scene():
    """
    Reset the scene so that the script runs cleanly each time.
    """

    # select all
    bpy.ops.object.select_all(action='SELECT')
    # delete all
    bpy.ops.object.delete(use_global=False)
    # remove data connected
    bpy.ops.outliner.orphans_purge(
        do_local_ids=True, do_linked_ids=True, do_recursive=True)


def create_material(name="my_generated_material"):
    """Creates a simple metallic material with a random base color."""
    # create new mat
    material = bpy.data.materials.new(name=name)

    # enable nodes
    material.use_nodes = True
    nodes = material.node_tree.nodes

    # get ref to Principled BSDF shader node
    principled_bsdf_node = material.node_tree.nodes['Principled BSDF']
    # set base color (using a random color for fun)
    principled_bsdf_node.inputs['Base Color'].default_value = (
        random.random(), random.random(), random.random(), 1)
    # set metallic
    principled_bsdf_node.inputs['Metallic'].default_value = 1.0
    # set the roughness
    principled_bsdf_node.inputs['Roughness'].default_value = random.uniform(
        0.1, 0.5)

    return material


def add_ico_sphere(subdivisions=5):
    """Creates an icosphere, shades it smooth, and returns the object."""
    # create ico sphere
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=subdivisions)
    # shade smooth
    bpy.ops.object.shade_smooth()
    # return ref to mesh
    return bpy.context.active_object


def main():
    clean_scene()
    # set render mode
    # set_viewports_mode(mode='RENDERED')

    # Add the mesh to the scene
    mesh_obj = add_ico_sphere(subdivisions=5)
    # create and assign material
    material = create_material(name="ShinyMetal")
    # apply mat to mesh
    mesh_obj.data.materials.append(material)


main()
