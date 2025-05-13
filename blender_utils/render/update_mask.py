import time
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


class RenderUpdateParams(TypedDict):
    engine: NR[btyping.RenderEngineTypeItems]


class RenderUpdateMask(UpdateMask):
    def __init__(self, obj, **kwargs: Unpack[RenderUpdateParams]):
        super().__init__(obj)

        for key, value in kwargs.items():
            if hasattr(obj, key):
                setattr(self, key, value)


class CyclesUpdateParams(TypedDict):
    # Scene
    device: NR[btyping.RenderEngineTypeItems]

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


class CyclesUpdateMask(UpdateMask):
    def __init__(self, obj, **kwargs: Unpack[CyclesUpdateParams]):
        super().__init__(obj)

        for key, value in kwargs.items():
            if hasattr(obj, key):
                setattr(self, key, value)


# adaptive_min_samples: int = 0
# adaptive_threshold: float = 0.009999999776482582
# ao_bounces: int = 1
# ao_bounces_render: int = 1
# auto_scrambling_distance: bool = False
# bake_type: str = "COMBINED"
# blur_glossy: float = 1.0
# camera_cull_margin: float = 0.10000000149011612
# caustics_reflective: bool = True
# caustics_refractive: bool = True
# debug_bvh_layout: str = "EMBREE"
# debug_bvh_time_steps: int = 0
# debug_bvh_type: str = "DYNAMIC_BVH"
# debug_use_compact_bvh: bool = False
# debug_use_cpu_avx2: bool = True
# debug_use_cpu_sse42: bool = True
# debug_use_cuda_adaptive_compile: bool = False
# debug_use_hair_bvh: bool = True
# debug_use_hip_adaptive_compile: bool = False
# debug_use_metal_adaptive_compile: bool = False
# debug_use_optix_debug: bool = False
# debug_use_spatial_splits: bool = False
# denoiser: str = "OPENIMAGEDENOISE"
# denoising_input_passes: str = "RGB_ALBEDO_NORMAL"
# denoising_prefilter: str = "ACCURATE"
# denoising_quality: str = "HIGH"
# denoising_use_gpu: bool = False
# device: str = "CPU"
# dicing_camera: None = None
# dicing_rate: float = 1.0
# diffuse_bounces: int = 4
# direct_light_sampling_type: str = "MULTIPLE_IMPORTANCE_SAMPLING"
# distance_cull_margin: float = 50.0
# fast_gi_method: str = "REPLACE"
# feature_set: str = "SUPPORTED"
# film_exposure: float = 1.0
# film_transparent_glass: bool = False
# film_transparent_roughness: float = 0.10000000149011612
# filter_width: float = 1.5
# glossy_bounces: int = 4
# guiding_directional_sampling_type: str = "RIS"
# guiding_distribution_type: str = "PARALLAX_AWARE_VMM"
# guiding_roughness_threshold: float = 0.05000000074505806
# guiding_training_samples: int = 128
# light_sampling_threshold: float = 0.009999999776482582
# max_bounces: int = 12
# max_subdivisions: int = 12
# min_light_bounces: int = 0
# min_transparent_bounces: int = 0
# offscreen_dicing_scale: float = 4.0
# pixel_filter_type: str = "BLACKMAN_HARRIS"
# rolling_shutter_duration: float = 0.10000000149011612
# rolling_shutter_type: str = "NONE"
# sample_clamp_direct: float = 0.0
# sample_clamp_indirect: float = 10.0
# sample_offset: int = 0
# sample_subset_length: int = 2048
# samples: int = 4096
# sampling_pattern: str = "AUTOMATIC"
# scrambling_distance: float = 1.0
# seed: int = 0
# shading_system: bool = False
# surface_guiding_probability: float = 0.5
# texture_limit: str = "OFF"
# texture_limit_render: str = "OFF"
# tile_size: int = 2048
# time_limit: float = 0.0
# transmission_bounces: int = 12
# transparent_max_bounces: int = 8
# use_adaptive_sampling: bool = True
# use_animated_seed: bool = False
# use_auto_tile: bool = True
# use_camera_cull: bool = False
# use_denoising: bool = True
# use_deterministic_guiding: bool = True
# use_distance_cull: bool = False
# use_fast_gi: bool = False
# use_guiding: bool = False
# use_guiding_direct_light: bool = True
# use_guiding_mis_weights: bool = True
# use_layer_samples: str = "USE"
# use_light_tree: bool = True
# use_sample_subset: bool = False
# use_surface_guiding: bool = True
# use_volume_guiding: bool = True
# volume_bounces: int = 0
# volume_guiding_probability: float = 0.5
# volume_max_steps: int = 1024
# volume_step_rate: float = 1.0
