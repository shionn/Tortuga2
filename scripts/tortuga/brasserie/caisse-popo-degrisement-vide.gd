extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_alert("Potion de dégrissement", "Cette caisse est vide.")
	player.play_anim_no()

func _on_area_3d_body_entered(body: Node3D) -> void:
	visible = not player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
