extends "res://scripts/interactable.gd"

var item = ""

func on_interact() -> void:
	bag.loot(item)
	visible = false
