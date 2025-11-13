extends Label

@onready var _player := $"../Player" as CharacterBody3D

func _process(delta: float) -> void:
	text = str(_player.global_position)
	text += "\nfps: " + str(Engine.get_frames_per_second())
