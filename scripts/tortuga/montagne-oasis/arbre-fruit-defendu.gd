extends "res://scripts/interactable.gd"

func on_interact() -> void:
	visible = false
	bag.loot(Bag.FruitDefendu)
	tags.add(Tags.FORBID_FRUIT_LOOTED)
	tags.remove(Tags.FORBID_FRUIT_SEARCH)

func on_tag_change() -> void:
	visible = not tags.have(Tags.FORBID_FRUIT_LOOTED)
