extends "res://scripts/interactable.gd"

@export var character = ""

func on_interact() -> void:
	Player.model = "res://assets/character/" + character
	get_tree().change_scene_to_file("res://world.tscn")
