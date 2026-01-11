extends "res://scripts/interactable.gd"

@export var item : String

func on_interact() -> void:
	bag.loot(item)

func on_tag_change() -> void:
	self.visible = bag.contain(Bag.ParcheminBarbeDrueDecoder) and not bag.contain(item) and not bag.contain(Bag.CarteHungConnut)

func on_item_change() -> void:
	self.visible = bag.contain(Bag.ParcheminBarbeDrueDecoder) and not bag.contain(item) and not bag.contain(Bag.CarteHungConnut)
