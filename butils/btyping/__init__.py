"""import types from bpy._typing.rna_enums as needed."""

import typing

from butils.btyping.animation import *  # noqa: F403
from butils.btyping.render import *  # noqa: F403

ViewPerspectiveTypeItems = typing.Literal["PERSP", "ORTHO", "CAMERA"]

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
