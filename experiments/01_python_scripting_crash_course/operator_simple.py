import math
from typing import Set

import bpy
import bpy.props


def main(context: bpy.types.Context):
    if not context.scene:
        print("Warning: No scene found in the current context.")
        return
    for ob in context.scene.objects:
        print(ob)


class JordanOperator(bpy.types.Operator):
    """Tooltip"""

    bl_idname = "object.jordan_operator"
    bl_label = "Jordan Operator"
    bl_options = {"REGISTER", "UNDO"}

    @classmethod
    def poll(cls, context: bpy.types.Context) -> bool:
        # The second return is unreachable, so I'm commenting it out.
        # If you intended conditional logic, you'll need to adjust.
        return True
        # return context.active_object is not None

    # create properties
    noise_scale: bpy.props.FloatProperty = bpy.props.FloatProperty(  # type: ignore[override]
        name="Noise Scale",
        description="The scale of the noise",
        default=1.0,
        min=0.0,
        max=2.0,
    )

    def execute(self, context: bpy.types.Context) -> Set[str]:  # type: ignore[override]
        main(context)

        print(bpy)

        # Delete all objects from the scene
        if not bpy.context.scene:
            # This case should ideally not happen if the operator is polled correctly
            # or if running in a standard Blender environment.
            print("Warning: No scene found in the current context.")
            return {"CANCELLED"}

        # Ensure we are in object mode before trying to select and delete
        if bpy.context.mode != "OBJECT":
            try:
                bpy.ops.object.mode_set(mode="OBJECT")
            except RuntimeError:
                # This can happen if there are no objects or the context is wrong
                print(
                    "Warning: Could not set to OBJECT mode. Proceeding with caution."
                )

        if bpy.context.scene.objects:  # Check if there are objects to delete
            bpy.ops.object.select_all(action="SELECT")
            bpy.ops.object.delete(use_global=False)

        # Create a camera facing down at z = 20
        bpy.ops.object.camera_add(
            enter_editmode=False,
            align="VIEW",
            location=(0, 0, 20),
            rotation=(0, 0, 0),
            scale=(1, 1, 1),
        )
        camera: bpy.types.Object | None = bpy.context.active_object
        print("camera:", camera)
        if not camera:
            print("Warning: Camera not created.")
            return {"CANCELLED"}

        # Create a blue point light
        bpy.ops.object.light_add(
            type="POINT", align="WORLD", location=(5, 5, 10), scale=(1, 1, 1)
        )
        light: bpy.types.Object | None = bpy.context.active_object
        print("light:", light)
        if (
            not light
            or not light.data
            or not isinstance(light.data, bpy.types.PointLight)
        ):
            print("Warning: Point light not created correctly.")
            return {"CANCELLED"}

        # light.data should now be a PointLight, so we can access its properties
        point_light_data: bpy.types.PointLight = light.data
        print("light.data.energy:", point_light_data.energy)
        point_light_data.energy = 1000
        point_light_data.color = (0, 0, 1)

        # Create cube
        ret: Set[str] = bpy.ops.mesh.primitive_cube_add(
            enter_editmode=True,  # Note: enters edit mode
            align="WORLD",
            location=(0, 0, 5),
            scale=(2, 2, 2),
        )
        print(ret)

        # Create a variable referencing the active object
        ao: bpy.types.Object | None = bpy.context.active_object
        print(ao)

        if not ao or not ao.data or not isinstance(ao.data, bpy.types.Mesh):
            print("Warning: Active object is not a mesh after cube creation.")
            # If we entered edit mode, we might need to exit it to recover or cancel
            if bpy.context.mode == "EDIT_MESH":
                bpy.ops.object.mode_set(mode="OBJECT")
            return {"CANCELLED"}

        mesh_data: bpy.types.Mesh = ao.data

        print("ao.location:", ao.location)
        print("ao.scale:", ao.scale)
        print("ao.rotation_euler:", ao.rotation_euler)

        degrees = 45.0  # Use float for consistency
        rad = math.radians(degrees)
        print(degrees, rad)

        print(math.degrees(2 * math.pi))
        print(math.radians(180.0))  # Use float

        ao.rotation_euler[2] += math.radians(45.0)

        # Ensure we are in object mode to add modifiers
        if bpy.context.mode == "EDIT_MESH":
            bpy.ops.object.mode_set(mode="OBJECT")

        print(ao.modifiers)

        mod_subsurf: bpy.types.Modifier = ao.modifiers.new(
            "My Subsurf", "SUBSURF"
        )

        if not isinstance(mod_subsurf, bpy.types.SubsurfModifier):
            raise TypeError(
                f"Expected SubsurfModifier, got {type(mod_subsurf)}"
            )

        print(mod_subsurf.levels)
        print(mod_subsurf.render_levels)
        mod_subsurf.levels = 3
        mod_subsurf.render_levels = 3  # Often good to keep these in sync

        # bpy.ops.object.shade_smooth() # This applies to the whole object

        # Set smooth shading per polygon
        # Ensure we are in object mode to access mesh.polygons, then edit mode if needed, or just set directly
        # For direct mesh data manipulation, it's often better to be in Object mode,
        # or ensure data is updated if in Edit mode.
        # If the cube was created with enter_editmode=True, we might still be in edit mode.
        # Let's ensure object mode for this operation for simplicity with direct data access.
        if bpy.context.mode != "OBJECT":
            bpy.ops.object.mode_set(mode="OBJECT")

        i = 0
        for face in mesh_data.polygons:
            face.use_smooth = True
            i += 1
            if i == 3:
                break

        mod_displace: bpy.types.Modifier = ao.modifiers.new(
            "My Displacement", "DISPLACE"
        )
        if not isinstance(mod_displace, bpy.types.DisplaceModifier):
            raise TypeError(
                f"Expected DisplaceModifier, got {type(mod_displace)}"
            )

        new_texture: bpy.types.Texture | None = bpy.data.textures.new(
            "My Texture", "DISTORTED_NOISE"
        )

        print(new_texture)
        if new_texture and isinstance(
            new_texture, bpy.types.DistortedNoiseTexture
        ):
            new_texture.noise_scale = self.noise_scale
            mod_displace.texture = new_texture
        elif new_texture:
            print(
                f"Warning: Texture 'My Texture' is of type {type(new_texture)}, not DistortedNoiseTexture."
            )
        else:
            print("Warning: Failed to create texture 'My Texture'.")

        new_mat: bpy.types.Material | None = bpy.data.materials.new(
            name="My Material"
        )
        if new_mat:
            if (
                ao.data
            ):  # ao and ao.data should be valid here from earlier checks
                mesh_data.materials.append(new_mat)  # Append to mesh_data

            new_mat.use_nodes = True
            if not new_mat.node_tree:
                print("Warning: No node tree created for the new material.")
                return {"CANCELLED"}

            # nodes = new_mat.node_tree.nodes
            # material_output = nodes.get("Material Output")
            # node_emission = nodes.new(type="ShaderNodeEmission")
            # ... (material node setup was commented out, leaving as is)
        else:
            print("Warning: Failed to create material 'My Material'.")

        if not bpy.context.screen:
            print("Warning: No screen found in the current context.")
            # This part is highly dependent on running in Blender's UI
            # and might not be suitable for all background scripts.
        else:
            for area in bpy.context.screen.areas:
                if area.type == "VIEW_3D":
                    for space in area.spaces:
                        if isinstance(space, bpy.types.SpaceView3D):
                            # space.type is an enum, not a string 'VIEW_3D'
                            # The check area.type == "VIEW_3D" is usually sufficient
                            space.shading.type = "RENDERED"
                            # space.shading has no attribute use_compositor
                            # For viewport compositor, it's usually bpy.context.scene.render.use_compositor
                            # or related to the view layer.
                            # For simplicity, I'll comment this out as it might be incorrect.
                            # space.shading.use_compositor = "ALWAYS"

        bpy.context.scene.use_nodes = True
        tree: bpy.types.NodeTree | None = bpy.context.scene.node_tree

        if tree:
            glare_node_untyped = tree.nodes.new(type="CompositorNodeGlare")
            if isinstance(glare_node_untyped, bpy.types.CompositorNodeGlare):
                glare_node: bpy.types.CompositorNodeGlare = glare_node_untyped
                glare_node.glare_type = "FOG_GLOW"

                composite_node: bpy.types.Node | None = tree.nodes.get(
                    "Composite"
                )
                render_layers_node: bpy.types.Node | None = tree.nodes.get(
                    "Render Layers"
                )

                if render_layers_node and composite_node:
                    glare_node.quality = "HIGH"
                    # glare_node.size is deprecated, use mix instead or check specific glare type properties
                    # For FOG_GLOW, size is still an int.
                    glare_node.size = 9  # Default is 8, max is 9 for FOG_GLOW in UI, but API might allow more
                    glare_node.threshold = 0.1

                    tree.links.new(
                        render_layers_node.outputs[0], glare_node.inputs[0]
                    )
                    tree.links.new(
                        glare_node.outputs[0], composite_node.inputs[0]
                    )
                else:
                    print(
                        "Warning: Composite or Render Layers node not found in compositor."
                    )
            else:
                print("Warning: Could not create Glare node.")
        else:
            print("Warning: Scene node tree not found for compositor.")

        return {"FINISHED"}


def menu_func(self: bpy.types.Menu, context: bpy.types.Context):
    if not self.layout:
        print("Warning: No layout found in the menu context.")
        return
    self.layout.operator(JordanOperator.bl_idname, text=JordanOperator.bl_label)


def register():
    bpy.utils.register_class(JordanOperator)
    bpy.types.VIEW3D_MT_object.append(menu_func)


def unregister():
    bpy.utils.unregister_class(JordanOperator)
    bpy.types.VIEW3D_MT_object.remove(menu_func)


if __name__ == "__main__":
    register()

    # test call
    # bpy.ops.object.jordan_operator() # Corrected bl_idname
