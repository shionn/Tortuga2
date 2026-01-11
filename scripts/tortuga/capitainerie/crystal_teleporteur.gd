extends "res://scripts/interactable.gd"

func on_tag_change() -> void:
	self.visible = tags.have(Tags.FORBID_FRUIT_SEARCH) and !bag.contain(Bag.CrystalTeleportationOasis)

func on_item_change() -> void:	
	self.visible = tags.have(Tags.FORBID_FRUIT_SEARCH) and !bag.contain(Bag.CrystalTeleportationOasis)

func on_interact() -> void:
	if not tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) :
		gui.open_alert("Cristal étrange", "C’est quoi ce truc ? ça semble dangereux faut mieux ne pas y toucher.")
	else :
		bag.loot(Bag.CrystalTeleportationOasis)
		tags.remove(Tags.FORBID_FRUIT_SEARCH_TELEPORT)
		gui.open_alert("Cristal étrange", "Ca doit être le cristal dont parlais Zakari.")
#		self.visible = false
