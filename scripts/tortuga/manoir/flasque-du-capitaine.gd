extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, """C'est la flasque de Rhum du capitaine."""))
	if tags.have(Tags.SEARCH_CAPTAIN_BOTTLE):
		bag.loot(Bag.BouteilleCapitain)

func on_item_change() -> void: 
	visible = not bag.contain(Bag.BouteilleCapitain)
