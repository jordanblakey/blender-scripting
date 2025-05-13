"""import types from bpy._typing.rna_enums as needed."""

import typing

ViewPerspectiveTypeItems = typing.Literal["PERSP", "ORTHO", "CAMERA"]

RenderEngineTypeItems = typing.Literal[
    "CYCLES", "BLENDER_EEVEE_NEXT", "BLENDER_WORKBENCH"
]
PreviewDenoiserTypeItems = typing.Literal["OPENIMAGEDENOISE", "OPTIX"]
PreviewDenoisingInputPassesTypeItems = typing.Literal[
    "RGB", "RGB_ALBEDO", "RGB_ALBEDO_NORMAL"
]
DenoisingPrefilterTypeItems = typing.Literal["NONE", "FAST", "ACCURATE"]
DenoiserTypeItems = typing.Literal["OPENIMAGEDENOISE", "OPTIX"]
DenoisingInputPassesTypeItems = typing.Literal[
    "RGB", "RGB_ALBEDO", "RGB_ALBEDO_NORMAL"
]

ImageTypeItems = typing.Literal[
    "BMP",  # BMP.Output image in bitmap format.
    "IRIS",  # Iris.Output image in SGI IRIS format.
    "PNG",  # PNG.Output image in PNG format.
    "JPEG",  # JPEG.Output image in JPEG format.
    "JPEG2000",  # JPEG 2000.Output image in JPEG 2000 format.
    "TARGA",  # Targa.Output image in Targa format.
    "TARGA_RAW",  # Targa Raw.Output image in uncompressed Targa format.
    "CINEON",  # Cineon.Output image in Cineon format.
    "DPX",  # DPX.Output image in DPX format.
    "OPEN_EXR_MULTILAYER",  # OpenEXR MultiLayer.Output image in multilayer OpenEXR format.
    "OPEN_EXR",  # OpenEXR.Output image in OpenEXR format.
    "HDR",  # Radiance HDR.Output image in Radiance HDR format.
    "TIFF",  # TIFF.Output image in TIFF format.
    "WEBP",  # WebP.Output image in WebP format.
    "FFMPEG",  # FFmpeg Video.
]

ShadingTypeItems = typing.Literal[
    "WIREFRAME",  # Wireframe.Display only edges of geometry without surface shading.
    "SOLID",  # Solid.Display objects with flat lighting and basic surface shading.
    "MATERIAL",  # Material Preview.Preview materials using predefined environment lights.
    "RENDERED",  # Rendered.Preview the final scene using the active render engine.
]

ConstraintTypeItems = typing.Literal[
    "CAMERA_SOLVER",  # Camera Solver.
    "FOLLOW_TRACK",  # Follow Track.
    "OBJECT_SOLVER",  # Object Solver.
    "COPY_LOCATION",  # Copy Location.Copy the location of a target (with an optional offset), so that they move together.
    "COPY_ROTATION",  # Copy Rotation.Copy the rotation of a target (with an optional offset), so that they rotate together.
    "COPY_SCALE",  # Copy Scale.Copy the scale factors of a target (with an optional offset), so that they are scaled by the same amount.
    "COPY_TRANSFORMS",  # Copy Transforms.Copy all the transformations of a target, so that they move together.
    "LIMIT_DISTANCE",  # Limit Distance.Restrict movements to within a certain distance of a target (at the time of constraint evaluation only).
    "LIMIT_LOCATION",  # Limit Location.Restrict movement along each axis within given ranges.
    "LIMIT_ROTATION",  # Limit Rotation.Restrict rotation along each axis within given ranges.
    "LIMIT_SCALE",  # Limit Scale.Restrict scaling along each axis with given ranges.
    "MAINTAIN_VOLUME",  # Maintain Volume.Compensate for scaling one axis by applying suitable scaling to the other two axes.
    "TRANSFORM",  # Transformation.Use one transform property from target to control another (or same) property on owner.
    "TRANSFORM_CACHE",  # Transform Cache.Look up the transformation matrix from an external file.
    "CLAMP_TO",  # Clamp To.Restrict movements to lie along a curve by remapping location along curve's longest axis.
    "DAMPED_TRACK",  # Damped Track.Point towards a target by performing the smallest rotation necessary.
    "IK",  # Inverse Kinematics.Control a chain of bones by specifying the endpoint target (Bones only).
    "LOCKED_TRACK",  # Locked Track.Rotate around the specified ('locked') axis to point towards a target.
    "SPLINE_IK",  # Spline IK.Align chain of bones along a curve (Bones only).
    "STRETCH_TO",  # Stretch To.Stretch along Y-Axis to point towards a target.
    "TRACK_TO",  # Track To.Legacy tracking constraint prone to twisting artifacts.
    "ACTION",  # Action.Use transform property of target to look up pose for owner from an Action.
    "ARMATURE",  # Armature.Apply weight-blended transformation from multiple bones like the Armature modifier.
    "CHILD_OF",  # Child Of.Make target the 'detachable' parent of owner.
    "FLOOR",  # Floor.Use position (and optionally rotation) of target to define a 'wall' or 'floor' that the owner cannot cross.
    "FOLLOW_PATH",  # Follow Path.Use to animate an object/bone following a path.
    "PIVOT",  # Pivot.Change pivot point for transforms (buggy).
    "SHRINKWRAP",  # Shrinkwrap.Restrict movements to surface of target mesh.
]

SpaceTypeItems = typing.Literal[
    "EMPTY",  # Empty.
    "VIEW_3D",  # 3D Viewport.Manipulate objects in a 3D environment.
    "IMAGE_EDITOR",  # UV/Image Editor.View and edit images and UV Maps.
    "NODE_EDITOR",  # Node Editor.Editor for node-based shading and compositing tools.
    "SEQUENCE_EDITOR",  # Video Sequencer.Video editing tools.
    "CLIP_EDITOR",  # Movie Clip Editor.Motion tracking tools.
    "DOPESHEET_EDITOR",  # Dope Sheet.Adjust timing of keyframes.
    "GRAPH_EDITOR",  # Graph Editor.Edit drivers and keyframe interpolation.
    "NLA_EDITOR",  # Nonlinear Animation.Combine and layer Actions.
    "TEXT_EDITOR",  # Text Editor.Edit scripts and in-file documentation.
    "CONSOLE",  # Python Console.Interactive programmatic console for advanced editing and script development.
    "INFO",  # Info.Log of operations, warnings and error messages.
    "TOPBAR",  # Top Bar.Global bar at the top of the screen for global per-window settings.
    "STATUSBAR",  # Status Bar.Global bar at the bottom of the screen for general status information.
    "OUTLINER",  # Outliner.Overview of scene graph and all available data-blocks.
    "PROPERTIES",  # Properties.Edit properties of active object and related data-blocks.
    "FILE_BROWSER",  # File Browser.Browse for files and assets.
    "SPREADSHEET",  # Spreadsheet.Explore geometry data in a table.
    "PREFERENCES",  # Preferences.Edit persistent configuration settings.
]
