extends "res://scripts/interactable.gd"

static var tries = 0

func on_interact() -> void:
	visible = false
	tries = tries + 1
	if randi_range(0,100) > 90  or tries >= 15:
		bag.loot(Bag.SelDeMontagne)
	else :
		gui.open_alert("Minage", "Il n'y a rien d'exploitable")
	print(tries)
