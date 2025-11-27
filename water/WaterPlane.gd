extends MeshInstance3D

@onready var _body = $StaticBody3D as StaticBody3D
@onready var _player =$/root/World/Player as CharacterBody3D

func set_perspective(perspective: bool) -> void:
	var material : = get_active_material(0);
	
	if material:
		# When changing between ortho/perspective, the far value changes
		# We must adjust our edge threshold to reflect this, or the shader will not work well
		material.set_shader_parameter("edge_scale", 0.1);
		#material.set_shader_parameter("")
