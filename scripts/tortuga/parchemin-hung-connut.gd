extends "res://scripts/interactable.gd"


func _on_area_3d_body_entered(body: Node3D) -> void:
	self.visible = bag.contain(Bag.ParcheminBarbeDrueDecoder)
