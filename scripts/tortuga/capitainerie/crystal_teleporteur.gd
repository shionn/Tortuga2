extends "res://scripts/interactable.gd"

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (player.tags.have(Tags.FORBID_FRUIT_SEARCH) and !bag.contain(Bag.CrystalTeleportationOasis)) :
		self.visible = true
		
func on_interact() -> void:
	if  not player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) :
		gui.open_alert("Cristal étrange", "C’est quoi ce truc ? ça semble dangereux faut mieux ne pas y toucher.")
	else :
		bag.loot(Bag.CrystalTeleportationOasis)
		player.tags.remove(Tags.FORBID_FRUIT_SEARCH_TELEPORT)
		gui.open_alert("Cristal étrange", "Ca doit être le cristal dont parlais Zakari.")
		self.visible = false
