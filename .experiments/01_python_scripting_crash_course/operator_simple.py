import bpy
import bpy.props
import math

def main(context):
    for ob in context.scene.objects:
        print(ob)

class JordanOperator(bpy.types.Operator):
    """Tooltip"""
    bl_idname = "object.jordan_operator"
    bl_label = "Jordan Operator"
    bl_options = {'REGISTER', 'UNDO'}

    @classmethod
    def poll(cls, context):
        return True
        return context.active_object is not None

    # create properties
    noise_scale: bpy.props.FloatProperty(
        name='Noise Scale',
        description='The scale of the noise',
        default=1.0,
        min=0.0,
        max=2.0
    )

    def execute(self, context):
        main(context)

        print(bpy)


        # Delete all objects from the scene
        for obj in bpy.context.scene.objects:
            obj.select_set(True)


    #    if len(bpy.context.scene.objects) > 0:
    #        bpy.ops.object.select_all(action='SELECT')
    #        bpy.ops.object.mode_set(mode='OBJECT')
        bpy.ops.object.delete(use_global=False)

        # Create a camera facing down at z = 20
        bpy.ops.object.camera_add(
            enter_editmode=False,
            align='VIEW',
            location=(0, 0, 20),
            rotation=(0, 0, 0), scale=(1, 1, 1))
        camera = bpy.context.active_object
        print('camera:', camera)

        # Create a blue point light
        bpy.ops.object.light_add(
            type='POINT',
            align='WORLD',
            location=(5, 5, 10),
            scale=(1, 1, 1))
        light = bpy.context.active_object
        print('light:', light)
        print('light.data.energy:', light.data.energy)
        light.data.energy = 1000
        light.data.color = (0, 0, 1)

        # Create cube
        ret = bpy.ops.mesh.primitive_cube_add(enter_editmode=True, align='WORLD', location=(0,0,5), scale=(2, 2, 2))
        print(ret) # this is the operation status set(['FINISHED'])

        # Create a variable referencing the active object (selected in 3d viewport or scene object tree)
        ao = bpy.context.active_object # this is the active object
        print(ao)


        print('ao.location:', ao.location) # type Vector
        print('ao.scale:', ao.scale) # type Vector
        print('ao.rotation_euler:', ao.rotation_euler) # type Euler
        # note that to set these you can assign a Tuple, but the Vector and Euler types themselves are mutable

        degrees = 45
        rad = degrees * math.pi / 180
        print(degrees, rad)

        print(math.degrees(2 * math.pi)) # deg from rad
        print(math.radians(180)) # rad from deg

        # print(ao.rotation_euler)
        # crx, cry, crz = ao.rotation_euler # destructure the Euler instance into axes
        # ao.rotation_euler = (crx, cry, crz + math.pi / 4)
        # ao.rotation_euler = (crx, cry, crz + math.radians(45))
        ao.rotation_euler[2] += math.radians(45) # more efficent to mod a single value relative to existing value
        # print(ao.rotation_euler) # check the result


        #print(ao.modifiers)
        print(bpy.context.active_object.modifiers) # check the applied modifiers to the selected object
        # Show every available modifier type
        #for m in bpy.types.Modifier.bl_rna.properties['type'].enum_items:
        #    print(m) # show all available modifiers

        # create a new modifier on the active object, and store it to mod_subsurf
        mod_subsurf = ao.modifiers.new('My Subsurf', 'SUBSURF')

        # Check the properties of the new modifiers (here they are defaults)
        print(mod_subsurf.levels) # find how to access this value in Pthon from the properties panel
        # by enable Preferences > Interface > Python tooltips and hovering "levels viewport"
        print(mod_subsurf.render_levels)
        # Change a modifier property
        mod_subsurf.levels = 3

        bpy.ops.object.mode_set(mode="OBJECT")

        # bpy.ops.object.shade_smooth()
        mesh = ao.data # in other words .data is an iterable with the faces comprising the "mesh" in it
        # We will set only 3 of the 6 faces to render "smooth"
        i = 0
        for face in mesh.polygons:
            print(face) # type MeshPolygon
            face.use_smooth = True
            i += 1
            if i == 3: break


        # create displacement modifier
        mod_displace = ao.modifiers.new('My Displacement', 'DISPLACE')
        # create the texture
        print(bpy.types.Texture.bl_rna.properties['type'].enum_items.keys()) # See available texture types
        # https://docs.blender.org/api/current/bpy.types.Texture.html
        new_texture = bpy.data.textures.new('My Texture', 'DISTORTED_NOISE')

        print(new_texture)

        # change the texture settings
        new_texture.noise_scale = self.noise_scale
        # apply the texture to the displacement modifiers
        mod_displace.texture = new_texture

        # create the material
        new_mat = bpy.data.materials.new(name='My Material')
        # add the material to the active object
        ao.data.materials.append(new_mat)

        new_mat.use_nodes = True
        nodes = new_mat.node_tree.nodes

        material_output = nodes.get('Material Output')
        node_emission = nodes.new(type='ShaderNodeEmission')
        node_emission.inputs[0].default_value = (0.0, 1.0, 1.0, 1.0) # Color
        node_emission.inputs[1].default_value = 5.0

        links = new_mat.node_tree.links
        new_link = links.new(node_emission.outputs[0], material_output.inputs[0])


        for area in bpy.context.screen.areas:
            if area.type == 'VIEW_3D':
                for space in area.spaces:
                    if space.type == 'VIEW_3D':
                        space.shading.type = 'RENDERED'
                        space.shading.use_compositor = 'ALWAYS'

        # Enable compositor node editor
        bpy.context.scene.use_nodes = True
        # Get the node_tree
        tree = bpy.context.scene.node_tree

        # Create a glare filter in the compositor node tree
        glare_node = tree.nodes.new(type='CompositorNodeGlare')
        glare_node.glare_type = 'FOG_GLOW'

        # Get the node_tree nodes for the compositor
        composite_node = tree.nodes.get('Composite')
        render_layers_node = tree.nodes.get('Render Layers')
        # print(glare_node, composite_node, render_layers_node)

        # Link the new nodes in the compositor node editor
        tree.links.new(render_layers_node.outputs[0], glare_node.inputs[0])
        tree.links.new(glare_node.outputs[0], composite_node.inputs[0])



        return {'FINISHED'}


def menu_func(self, context):
    self.layout.operator(JordanOperator.bl_idname, text=SimpleOperator.bl_label)


# Register and add to the "object" menu (required to also use F3 search "Simple Object Operator" for quick access).
def register():
    bpy.utils.register_class(JordanOperator)
    bpy.types.VIEW3D_MT_object.append(menu_func)


def unregister():
    bpy.utils.unregister_class(JordanOperator)
    bpy.types.VIEW3D_MT_object.remove(menu_func)


if __name__ == "__main__":
    register()

    # test call
    bpy.ops.object.simple_operator()
