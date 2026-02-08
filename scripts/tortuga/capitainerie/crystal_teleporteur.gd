extends "res://scripts/interactable.gd"

func on_item_change() -> void:	
	self.visible = !bag.contain(Bag.CrystalTeleportationOasis)

func on_interact() -> void:
	if not tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) :
		gui.open_dialog_next(Dialog.playerSay(player, "C’est quoi ce truc ? Ça semble dangereux faut mieux ne pas y toucher."))
	else :
		gui.open_dialog_next(Dialog.playerSay(player,"Ca doit être le cristal dont parlais Zakari.")
			.on_close(_on_loot)
		)

func _on_loot():
	bag.loot(Bag.CrystalTeleportationOasis)
	tags.remove(Tags.FORBID_FRUIT_SEARCH_TELEPORT)
	
