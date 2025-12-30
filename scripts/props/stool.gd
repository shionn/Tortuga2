extends "res://scripts/interactable.gd"

@export var direction = 0 as float

func on_interact() -> void:
	player.sit(self.global_position, deg_to_rad(direction))
