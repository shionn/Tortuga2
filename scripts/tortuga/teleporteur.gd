extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) :
		gui.open_alert("Téléporteur", """Cette pierre étrange est recouverte de glyphe mais je n’y comprends rien.""")
	else : 
		gui.open_alert("Pierre étrange", """Cette pierre permet de se téléporter au sommet de la montagne mais il me faut la pierre pour l’activer.""")
