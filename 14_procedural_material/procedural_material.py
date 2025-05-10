import bpy
import colorsys
import os
import sys
import math

ENGINE = 'CYCLES'
RESOLUTION_PERCENTAGE = 200
RENDER_IMAGE = False
RENDER_ANIMATION = False

################################################################################
# Set Up Script
################################################################################

# blender -b -P headless_mode.py  # debug scripts
# blender -P headless_mode.py  # work in UI

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + '.blend'

# Import custom modules
modules_path = os.path.join(dirname, '..')
if not modules_path in sys.path:
    sys.path.append(modules_path)
import blender_utils  # nopep8

blender_utils.scene.clean()
blender_utils.blend_file.create_or_open(blend_file)

################################################################################
# Define Script
################################################################################


def main():
    blender_utils.scene.setup_starter_scene(
        background_color=(*colorsys.hls_to_rgb(2/3, 0, 1/4), 1))
    bpy.data.objects.get('Sun').data.angle = math.pi / 18

    # create object
    bpy.ops.mesh.primitive_uv_sphere_add(radius=1)
    object = bpy.context.active_object
    bpy.ops.object.shade_smooth()
    bpy.ops.object.modifier_add(type='SUBSURF')
    bpy.context.object.modifiers["Subdivision"].levels = 2
    material = create_material()
    object.data.materials.append(material)

    # preview in viewport
    blender_utils.ui.set_view3d_shading_type('RENDERED')


def create_material():
    # create and apply material
    material = bpy.data.materials.new(name='Material')

    # prepare to use shader editor
    material.use_nodes = True
    nodes = material.node_tree.nodes
    links = material.node_tree.links

    # create and position nodes
    principled_bsdf_node = nodes.get('Principled BSDF')
    texture_coordinate_node = nodes.new(type='ShaderNodeTexCoord')
    texture_coordinate_node.location = (-600, 0)
    color_ramp_node = nodes.new(type='ShaderNodeValToRGB')
    color_ramp_node.location = (-300, 0)

    # create links between nodes
    links.new(
        texture_coordinate_node.outputs['Normal'],
        color_ramp_node.inputs['Fac'])
    links.new(
        color_ramp_node.outputs['Color'],
        principled_bsdf_node.inputs['Base Color'])

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

print('script stage starting...')
main()
print('script stage complete.')

blender_utils.blend_file.save(blend_file)

print('render stage starting...')
blender_utils.render.config_engine(ENGINE, 0, True)

blender_utils.render.config_render_paths(
    cwd=dirname, filename='viewport_render',
    resolution_percentage=RESOLUTION_PERCENTAGE)
blender_utils.render.render_viewport(
    image_format='PNG', resolution_percentage=RESOLUTION_PERCENTAGE,
    shading_type="WIREFRAME", view_perspective='ORTHO')

blender_utils.render.config_render_paths(
    cwd=dirname, filename='cycles_render',
    resolution_percentage=RESOLUTION_PERCENTAGE)
blender_utils.render.render_image(resolution_percentage=RESOLUTION_PERCENTAGE)

print('render stage complete.')
