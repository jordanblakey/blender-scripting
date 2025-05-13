import typing

RenderEngineTypeItems = typing.Literal[
    "CYCLES", "BLENDER_EEVEE_NEXT", "BLENDER_WORKBENCH"
]
DevicesTypeItems = typing.Literal["CPU", "GPU"]
PreviewDenoiserTypeItems = typing.Literal["OPENIMAGEDENOISE", "OPTIX"]
PreviewDenoisingInputPassesTypeItems = typing.Literal[
    "RGB", "RGB_ALBEDO", "RGB_ALBEDO_NORMAL"
]
DenoisingPrefilterTypeItems = typing.Literal["NONE", "FAST", "ACCURATE"]
DenoiserTypeItems = typing.Literal["OPENIMAGEDENOISE", "OPTIX"]
DenoisingInputPassesTypeItems = typing.Literal[
    "RGB", "RGB_ALBEDO", "RGB_ALBEDO_NORMAL"
]
DenoisingQualityTypeItems = typing.Literal["HIGH", "BALANCED", "FAST"]
