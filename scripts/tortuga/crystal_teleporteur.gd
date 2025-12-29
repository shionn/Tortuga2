extends "res://scripts/interactable.gd"

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT)) :
		self.visible = true
