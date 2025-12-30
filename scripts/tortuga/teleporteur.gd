extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) or bag.contain(Bag.CrystalTeleportation):
		gui.open_alert("Pierre étrange", """Cette pierre permet de se téléporter au sommet de la montagne mais il me faut la pierre pour l’activer.""")
	else : 
		gui.open_alert("Téléporteur", """Cette pierre étrange est recouverte de glyphe mais je n’y comprends rien.""")

func on_item_drop(item : Item) -> void:
	if item.name == Bag.CrystalTeleportation : 
		player.play_anim_interact()
		player.teleport(Vector3(172,105,-253), deg_to_rad(-133))
	else :
		super.on_item_drop(item)
