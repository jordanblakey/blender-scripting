from typing import Callable, TypedDict, Unpack
from typing import NotRequired as NR

from blender_utils import btyping


class UpdateMask:
    def __init__(self, obj):
        self.obj = obj

    def up(self, name, value):
        R, G, B, C = "\033[91m", "\033[92m", "\033[94m", "\033[0m"
        prev = getattr(self, name)
        setattr(self.obj, name, value)
        print(f"{R}{name}{C} {type(value)}: {B}{prev}{C} -> {G}{value}{C}")

    def apply(self):
        for name in dir(self):
            value = getattr(self, name)
            if (
                not name == "obj"
                and not name.startswith("__")
                and not isinstance(value, Callable)
            ):
                value = getattr(self, name)
                self.up(name, value)


class RenderUpdateMask(UpdateMask):
    class RenderUpdateParams(TypedDict):
        # Scene
        engine: NR[btyping.RenderEngineTypeItems]

        # Scene > Performance > Memory > Final Render
        use_persistent_data: NR[bool]

    def __init__(self, obj, **kwargs: Unpack[RenderUpdateParams]):
        super().__init__(obj)

        for key, value in kwargs.items():
            if hasattr(obj, key):
                setattr(self, key, value)


class CyclesUpdateMask(UpdateMask):
    class CyclesUpdateParams(TypedDict):
        # Scene
        device: NR[btyping.DevicesTypeItems]

        # Scene > Sampling > Viewport
        use_preview_adaptive_sampling: NR[bool]
        preview_adaptive_threshold: NR[float]
        preview_samples: NR[int]
        preview_adaptive_min_samples: NR[int]

        # Scene > Sampling > Viewport > Denoise
        use_preview_denoising: NR[bool]
        preview_denoiser: NR[btyping.PreviewDenoiserTypeItems]
        preview_denoising_input_passes: NR[
            btyping.PreviewDenoisingInputPassesTypeItems
        ]
        preview_denoising_prefilter: NR[btyping.DenoisingPrefilterTypeItems]
        preview_denoising_quality: NR[btyping.DenoisingQualityTypeItems]
        preview_denoising_start_sample: NR[int]
        preview_denoising_use_gpu: NR[bool]

        # # Scene > Sampling > Viewport
        use_adaptive_sampling: NR[bool]
        adaptive_threshold: NR[float]
        samples: NR[int]
        preview_adaptive_min_samples: NR[int]
        time_limit: NR[float]

        # Scene > Sampling > Viewport > Denoise
        use_denoising: NR[bool]
        denoiser: NR[btyping.DenoiserTypeItems]
        denoising_input_passes: NR[btyping.DenoisingInputPassesTypeItems]
        denoising_prefilter: NR[btyping.DenoisingPrefilterTypeItems]
        denoising_quality: NR[btyping.DenoisingQualityTypeItems]
        denoising_use_gpu: NR[bool]

        # Scene > Light Paths > Max Bounces
        max_bounces: NR[int]
        diffuse_bounces: NR[int]
        glossy_bounces: NR[int]
        transmission_bounces: NR[int]
        volume_bounces: NR[int]
        transparent_max_bounces: NR[int]

        sample_clamp_direct: NR[float]
        sample_clamp_indirect: NR[float]

    def __init__(self, obj, **kwargs: Unpack[CyclesUpdateParams]):
        super().__init__(obj)

        for key, value in kwargs.items():
            if hasattr(obj, key):
                setattr(self, key, value)
