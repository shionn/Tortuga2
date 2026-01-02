extends Node3D

class_name FixColor

@export var sat = 1.0
@export var val = 0.6

func _ready() -> void:
	fix(self, sat, val)

static func fix(node:Node3D, sat = 1.0, val=0.6) -> void :
	var mesh = (node as MeshInstance3D)
	if mesh :
		var i = 0
		var mat = mesh.get_active_material(i) as StandardMaterial3D
		while mat != null :
			fixMat(mesh.name,mat)
			mat.metallic = 0
			i = i+1
			mat = mesh.get_active_material(i) as StandardMaterial3D
	else :
		for child in  node.get_children() :
			fix(child)

static func fixMat(name: String, mat:StandardMaterial3D) -> void :
	if mat.albedo_color.h > 0.477 and mat.albedo_color.h < 0.478 :
		# ca c'est le vert
		mat.albedo_color.s = 1
		mat.albedo_color.v = 0.6
	elif mat.albedo_color.h > 0.087 and mat.albedo_color.h < 0.088 :
		# oraneg carotte
		mat.albedo_color.s = 1
		mat.albedo_color.v = 1
	elif mat.albedo_color.h > 0.056 and mat.albedo_color.h < 0.057 :
		# pot terre cuite
		mat.albedo_color.s = 0.6
		print(name +"," +str(mat.albedo_color.h)+","+str(mat.albedo_color.s)+","+str(mat.albedo_color.v))
	elif mat.albedo_color.h > 0.043 and mat.albedo_color.h < 0.044 :
		# terre du pot convien pour moi
		pass
	elif mat.albedo_color.h > 0.503 and mat.albedo_color.h < 0.504 :
		mat.albedo_color.s = 0.9
		mat.albedo_color.v = 0.5
	elif mat.albedo_color.h > 0.063 and mat.albedo_color.h < 0.064 :
		mat.albedo_color.s = 0.8
		mat.albedo_color.v = 0.9
	else :
		print(name +"," +str(mat.albedo_color.h)+","+str(mat.albedo_color.s)+","+str(mat.albedo_color.v))
		mat.albedo_color.s = 1
		mat.albedo_color.v = 1
