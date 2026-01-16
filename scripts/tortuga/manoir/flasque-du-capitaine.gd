extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if tags.have(Tags.SEARCH_CAPTAIN_BOTTLE):
		bag.loot(Bag.BouteilleCapitain)
	else :
		gui.open_alert("Flaque du Capitaine", """C'est la flasque de Wisky du capitaine.""")

func on_item_change() -> void: 
	visible = not bag.contain(Bag.BouteilleCapitain)
