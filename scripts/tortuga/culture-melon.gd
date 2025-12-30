extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if player.tags.have(Tags.FORBID_FRUIT_SEARCH) && !bag.contain(Bag.Melon):
		self.visible = false
		bag.loot(Bag.Melon)
		player.play_anim_interact()
	else :
		gui.open_alert("Melon", "Ces melons semblent délicieux")
