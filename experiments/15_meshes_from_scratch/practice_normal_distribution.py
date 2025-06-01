import math
import random

import bpy

obj = bpy.data.objects.get("Cube")
if obj:
    bpy.data.objects.remove(obj)


for i in range(100):
    r = random.normalvariate(mu=0.2, sigma=0.1)
    x = random.normalvariate(mu=0, sigma=2)
    z = abs(random.normalvariate(mu=0, sigma=2))
    bpy.ops.mesh.primitive_ico_sphere_add(
        subdivisions=2,
        radius=r,
        location=(x, 0, z),
        rotation=(math.radians(-90), 0, 0),
    )
    obj = bpy.context.active_object
