extends Node3D

class_name FixColor

@export var sat = 1.0
@export var val = 0.6

func _ready() -> void:
	fix(self, sat, val)

static func fix(node:Node3D, sat = 1.0, val=0.6) -> void :
	print(node)
	var mesh = (node as MeshInstance3D)
	if mesh :
		var i = 0
		var mat = mesh.get_active_material(i) as StandardMaterial3D
		while mat != null :
			print(str(mat.albedo_color.s)+","+str(mat.albedo_color.v))
			mat.albedo_color.s = sat
			mat.albedo_color.v = 1 #mat.albedo_color.v * val
			mat.metallic = 0
			i = i+1
			mat = mesh.get_active_material(i) as StandardMaterial3D
	else :
		for child in  node.get_children() :
			fix(child)
	
