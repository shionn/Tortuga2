extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, "Ce fruit est magnifique, c’est probablement le fruit défendu.")
		.on_close(_loot)
	)

func _loot() : 
	bag.loot(Bag.FruitDefendu)
	tags.add(Tags.FORBID_FRUIT_LOOTED)
	tags.remove(Tags.FORBID_FRUIT_SEARCH)

func on_tag_change() -> void:
	visible = not tags.have(Tags.FORBID_FRUIT_LOOTED)
