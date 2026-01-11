extends Node3D

@onready var windmill = $windmill as Node3D
#@onready var _player = $"/root/World/Player" as Player

func _process(delta: float) -> void:
	#visible = _player.tags.have(Tags.HUN)
	windmill.rotate_z(-delta*0.5)
	
	
