extends Node3D

@onready var _player_pivot = $Player/Pivot
@onready var _player_camera = $Player/CameraPivot

func _on_ready() -> void:
	_player_pivot.rotate_y(deg_to_rad(165))
	_player_camera.rotate_y(deg_to_rad(165))
	print("ready")
