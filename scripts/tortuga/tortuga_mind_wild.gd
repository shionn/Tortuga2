extends Node3D

@onready var windmill = $windmill as Node3D

func _process(delta: float) -> void:
	windmill.rotate_z(-delta*0.5)
	
	
