extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_alert("Potion de dégrissement", "Cette caisse est vide.")
	player.play_anim_no()

func on_tag_change() -> void:
	visible = not player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
