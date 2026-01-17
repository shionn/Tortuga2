extends "res://scripts/interactable.gd"

@onready var _next_without_feather = $"../nest-without-feather" as Node3D

func on_interact() -> void:
	visible = false
	_next_without_feather.visible = true
