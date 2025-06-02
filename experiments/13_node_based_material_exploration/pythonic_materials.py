import os

import bpy

import butils

ENGINE = "CYCLES"
RESOLUTION_PERCENTAGE = 200
RENDER_VIEWPORT = True
RENDER_IMAGE = False
RENDER_ANIMATION = False

################################################################################
# Set Up Script
################################################################################

# blender -P headless_mode.py -b  # run without UI to debug scripts
# blender -P headless_mode.py  # run with UI to check output and work visually

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + ".blend"
butils.scene.clean()
butils.blend_file.create_or_open(blend_file)

################################################################################
# Compose Functions
################################################################################


def main():
    bpy.ops.outliner.orphans_purge()  # remove unused materials
    # styled_sphere = create_styled_icosphere()
    # You can do more with styled_sphere here if needed


################################################################################
# Define Functions
################################################################################


def create_material(
    material_name="my_generated_material",
    bsdf_node_identifier="ShaderNodeBsdfPrincipled",
    bsdf_properties=None,
):
    """
    Creates a new material, sets up its node tree with a specified BSDF node,
    and configures its properties.

    Args:
        material_name (str): Name for the new material.
        bsdf_node_identifier (str): The identifier for the BSDF node to use
                                    (e.g., "ShaderNodeBsdfPrincipled",
                                    "ShaderNodeBsdfDiffuse", "ShaderNodeEmission").
        bsdf_properties (dict, optional): A dictionary of properties to set on the
                                          BSDF node, where keys are input names
                                          and values are the values to set.
                                          If None and bsdf_node_identifier is
                                          "ShaderNodeBsdfPrincipled", default
                                          properties (red, metallic, no roughness)
                                          will be applied.

    Returns:
        bpy.types.Material: The created and configured material, or None if failed.
    """
    material = bpy.data.materials.new(name=material_name)
    material.use_nodes = True

    if not material.node_tree:  # Should not happen if use_nodes is True
        print(f"Error: Node tree not created for material '{material_name}'.")
        bpy.data.materials.remove(material)  # Clean up created material
        return None

    nodes = material.node_tree.nodes
    links = material.node_tree.links

    # Get the Material Output node (should always exist after use_nodes=True)
    material_output_node = nodes.get("Material Output")
    if not material_output_node:
        print(
            f"Error: 'Material Output' node not found in material '{material_name}'."
        )
        bpy.data.materials.remove(material)
        return None

    target_bsdf_node = None

    # If the requested BSDF is the default Principled BSDF
    if bsdf_node_identifier == "ShaderNodeBsdfPrincipled":
        target_bsdf_node = nodes.get("Principled BSDF")
        if not target_bsdf_node:  # If it was somehow removed, create it
            try:
                target_bsdf_node = nodes.new(type="ShaderNodeBsdfPrincipled")
            except RuntimeError as e:
                print(f"Error creating 'ShaderNodeBsdfPrincipled': {e}")
                bpy.data.materials.remove(material)
                return None
    else:
        # If a different BSDF is requested, remove the default Principled BSDF if it exists
        default_principled_node = nodes.get("Principled BSDF")
        if default_principled_node:
            nodes.remove(default_principled_node)
        # Create the new specified BSDF node
        try:
            target_bsdf_node = nodes.new(type=bsdf_node_identifier)
        except RuntimeError as e:
            print(f"Error creating node of type '{bsdf_node_identifier}': {e}")
            bpy.data.materials.remove(material)
            return None

    if not target_bsdf_node:  # Should have a target_bsdf_node by now
        print(
            f"Error: Failed to obtain or create target BSDF node '{bsdf_node_identifier}'."
        )
        bpy.data.materials.remove(material)
        return None

    # Link the BSDF node to the Material Output node's Surface input
    output_socket = None
    if "BSDF" in target_bsdf_node.outputs:
        output_socket = target_bsdf_node.outputs["BSDF"]
    elif "Shader" in target_bsdf_node.outputs:  # For Add/Mix Shaders
        output_socket = target_bsdf_node.outputs["Shader"]
    elif (
        target_bsdf_node.outputs
    ):  # Fallback to the first output (e.g., "Emission" for Emission node)
        output_socket = target_bsdf_node.outputs[0]

    if output_socket:
        links.new(output_socket, material_output_node.inputs["Surface"])
    else:
        print(
            f"Error: Node '{bsdf_node_identifier}' has no suitable output socket to link."
        )
        # If we created this node, we might want to remove it
        if target_bsdf_node.name not in (
            "Principled BSDF",
            "Material Output",
        ):  # Avoid removing essential defaults if logic error
            nodes.remove(target_bsdf_node)
        bpy.data.materials.remove(material)
        return None

    # Prepare properties to set
    actual_properties_to_set = {}
    if bsdf_properties:
        actual_properties_to_set = bsdf_properties
    elif bsdf_node_identifier == "ShaderNodeBsdfPrincipled":
        # Default properties for Principled BSDF if none are provided
        actual_properties_to_set = {
            "Base Color": (1, 0, 0, 1),  # Red
            "Metallic": 1.0,
            "Roughness": 0.0,
        }

    # Set properties on the target BSDF node
    for input_name, value in actual_properties_to_set.items():
        if input_name in target_bsdf_node.inputs:
            input_socket = target_bsdf_node.inputs[input_name]
            try:
                input_socket.default_value = value
            except Exception as e:
                print(
                    f"Warning: Could not set input '{input_name}' to '{value}' on node '{target_bsdf_node.name}'. Error: {e}"
                )
        else:
            print(
                f"Warning: Input '{input_name}' not found on node '{target_bsdf_node.name}' (type: {target_bsdf_node.bl_idname})."
            )

    return material


def create_styled_icosphere():
    """
    Creates an icosphere with 3 subdivisions, shades it smooth,
    and applies a material generated by create_material().
    """
    frosted_glass_properties = {
        "Base Color": (1.0, 1.0, 1.0, 1.0),  # White
        "Metallic": 0.0,
        "Roughness": 0.8,  # High roughness for frosted look
        "Transmission": 1.0,  # Full transmission for glass
        "IOR": 1.45,  # Index of Refraction for glass
    }
    material = create_material(
        material_name="frosted_glass_material",
        bsdf_node_identifier="ShaderNodeBsdfPrincipled",
        bsdf_properties=frosted_glass_properties,
    )

    if material is None:
        print("Failed to create material. Aborting icosphere creation.")
        return None

    bpy.ops.mesh.primitive_ico_sphere_add(
        subdivisions=3, enter_editmode=False, align="WORLD", location=(0, 0, 0)
    )
    ico_obj = bpy.context.active_object
    if ico_obj and isinstance(ico_obj.data, bpy.types.Mesh):
        bpy.ops.object.shade_smooth()
        # Assign material to the object

        if ico_obj.data.materials:
            ico_obj.data.materials[0] = material
        else:
            ico_obj.data.materials.append(material)
        return ico_obj
    return None


################################################################################
# Run Script, Save .blend File, Render
################################################################################

print("script stage starting...")
main()
print("script stage complete.")
butils.blend_file.save(blend_file)

if ENGINE == "CYCLES":
    print("Applying fast Cycles preset...")
    butils.render.apply_fast_cycles_preset()
print("render stage starting...")
butils.render.quick_render(
    cwd=dirname,
    engine=ENGINE,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    viewport=RENDER_VIEWPORT,
    image=RENDER_IMAGE,
    animation=RENDER_ANIMATION,
)
print("render stage complete.")
