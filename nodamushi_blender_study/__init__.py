import bpy

#
# bl_info
# https://developer.blender.org/docs/handbook/addons/addon_meta_info/
#
bl_info = {
    "name" : "Nodamushi Blender Study",
    "author" : "nodamushi",
    "description" : "Sample addons to learn how to develop a Blender addon",
    "blender" : (4, 1, 0),
    "version" : (0, 1),
    "category" : "Object"
}

##################################################
##################################################
# Add classes
#   Operator: bpy.types.Operator, OP, https://docs.blender.org/api/current/bpy.types.Operator.html
#   Panel: bpy.types.Panel, PT, https://docs.blender.org/api/current/bpy.types.Panel.html
#
classes = []
##################################################

# TODO:
print("TODO")

################# Don't touch #####################
def register():
    for c in classes:
        bpy.utils.register_class(c)

def unregister():
    for c in classes:
        bpy.utils.unregister_class(c)

if __name__ == "__main__":
    register()
###################################################
