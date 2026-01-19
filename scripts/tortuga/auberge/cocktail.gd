extends "res://scripts/interactable.gd"

var item = ""

func on_interact() -> void:
	if item == "":
		gui.append_to_console("Vous buvez le cocktail")
	else :
		bag.loot(item)
	visible = false
