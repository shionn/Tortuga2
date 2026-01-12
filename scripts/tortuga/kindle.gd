extends "res://scripts/pnj.gd" 


@onready var kindle = $".." as CharacterBody3D

var follow = false

func on_interact() -> void:
	kindle.follow = !kindle.follow
