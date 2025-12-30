extends "res://scripts/interactable.gd"

@export var character = ""

func on_interact() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	Player.model = "res://assets/character/" + character
	get_tree().change_scene_to_file("res://scenes/world.tscn")
