extends "res://scripts/interactable.gd"

@export var item : String

func on_interact() -> void:
	bag.loot(item)
	visible = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	self.visible = bag.contain(Bag.ParcheminBarbeDrueDecoder) and not bag.contain(item) and not bag.contain(Bag.CarteHungConnut)
