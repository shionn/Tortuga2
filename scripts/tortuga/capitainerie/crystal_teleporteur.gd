extends "res://scripts/interactable.gd"

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (player.tags.have(Tags.FORBID_FRUIT_SEARCH) and !bag.contain(Bag.CrystalTeleportation)) :
		self.visible = true
		
func on_interact() -> void:
	if  not player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) :
		gui.open_alert("Crystal étrange", "C’est quoi ce truc ? ça semble dangereux faut mieux ne pas y toucher.")
	else :
		bag.loot(Bag.CrystalTeleportation)
		self.visible = false
