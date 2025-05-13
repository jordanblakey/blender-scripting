from typing import Callable


class UpdateMask:
    def __init__(self, obj):
        self.obj = obj

    def up(self, name, value):
        R, G, B, C = "\033[91m", "\033[92m", "\033[94m", "\033[0m"
        prev = getattr(self, name)
        setattr(self, name, value)
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
    def __init__(self, obj):
        super().__init__(obj)

    engine = "CYCLES"


class CyclesUpdateMask(UpdateMask):
    # Scene
    device = "GPU"

    # Scene > Sampling > Viewport
    use_preview_adaptive_sampling = True
    preview_adaptive_threshold = 0.1
    preview_samples = 512
    preview_adaptive_min_samples = 0

    # Scene > Sampling > Viewport > Denoise
    use_preview_denoising = False
    preview_denoiser = "AUTO"
    preview_denoising_input_passes = "RGB_ALBEDO"
    preview_denoising_prefilter = "FAST"
    preview_denoising_quality = "BALANCED"
    preview_denoising_start_sample = 1
    preview_denoising_use_gpu = True

    # TODO: Where are these in the UI?
    preview_dicing_rate = 8.0
    preview_pause = False
    preview_scrambling_distance = False

    # Scene > Sampling > Viewport
    use_preview_adaptive_sampling = True
    preview_adaptive_threshold = 0.1
    preview_samples = 512
    preview_adaptive_min_samples = 0
