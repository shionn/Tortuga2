extends "res://scripts/interactable.gd"

func on_interact() -> void:
	visible = false
	bag.loot(Bag.FruitDefendu)
	player.tags.add(Tags.FORBID_FRUIT_LOOTED)

func _on_area_3d_body_entered(body: Node3D) -> void:
	visible = not player.tags.have(Tags.FORBID_FRUIT_LOOTED)
