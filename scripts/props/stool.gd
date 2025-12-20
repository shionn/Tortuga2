extends "res://scripts/interactable.gd"

@export var direction = 0 as float

func on_interact() -> void:
	player.position = self.global_position
	player.sit(deg_to_rad(direction))
