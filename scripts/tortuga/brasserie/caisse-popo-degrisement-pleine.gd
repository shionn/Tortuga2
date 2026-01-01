extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if (bag.contain(Bag.PotionDegrisement)) :
		gui.open_alert("Potion de dégrissement", "J'en ai déjà")
		player.play_anim_no()
	else :
		bag.loot(Bag.PotionDegrisement)

func _on_area_3d_body_entered(body: Node3D) -> void:
	visible = player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
