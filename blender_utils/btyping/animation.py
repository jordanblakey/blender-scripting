import typing

BeztripleInterpolationEasingItems = typing.Literal[
    "AUTO",  # Automatic Easing.Easing type is chosen automatically based on what the type of interpolation used (e.g. Ease In for transitional types, and Ease Out for dynamic effects).
    "EASE_IN",  # Ease In.Only on the end closest to the next keyframe.
    "EASE_OUT",  # Ease Out.Only on the end closest to the first keyframe.
    "EASE_IN_OUT",  # Ease In and Out.Segment between both keyframes.
]

KeyframeHandleTypeItems = typing.Literal[
    "FREE",  # Free.Completely independent manually set handle.
    "ALIGNED",  # Aligned.Manually set handle with rotation locked together with its pair.
    "VECTOR",  # Vector.Automatic handles that create straight lines.
    "AUTO",  # Automatic.Automatic handles that create smooth curves.
    "AUTO_CLAMPED",  # Auto Clamped.Automatic handles that create smooth curves which only change direction at keyframes.
]

BeztripleInterpolationModeItems = typing.Literal[
    "CONSTANT",  # Constant.No interpolation, value of A gets held until B is encountered.
    "LINEAR",  # Linear.Straight-line interpolation between A and B (i.e. no ease in/out).
    "BEZIER",  # Bézier.Smooth interpolation between A and B, with some control over curve shape.
    "SINE",  # Sinusoidal.Sinusoidal easing (weakest, almost linear but with a slight curvature).
    "QUAD",  # Quadratic.Quadratic easing.
    "CUBIC",  # Cubic.Cubic easing.
    "QUART",  # Quartic.Quartic easing.
    "QUINT",  # Quintic.Quintic easing.
    "EXPO",  # Exponential.Exponential easing (dramatic).
    "CIRC",  # Circular.Circular easing (strongest and most dynamic).
    "BACK",  # Back.Cubic easing with overshoot and settle.
    "BOUNCE",  # Bounce.Exponentially decaying parabolic bounce, like when objects collide.
    "ELASTIC",  # Elastic.Exponentially decaying sine wave, like an elastic band.
]
