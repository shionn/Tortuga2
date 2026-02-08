extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player,"Au pied du coffre il y a un parchemin.")
		.on_close(func() : bag.loot(Bag.ParcheminHungConnut))
	)

func on_item_change() -> void:
	visible = not bag.contain(Bag.ParcheminHungConnut)
