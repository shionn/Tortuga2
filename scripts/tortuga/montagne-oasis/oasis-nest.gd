extends "res://scripts/interactable.gd"

@onready var _next_without_feather = $"../nest-without-feather" as Node3D

func on_interact() -> void:
	bag.loot(Bag.Plume)

func on_item_change() -> void:	
	print ("update")
	visible = not bag.contain(Bag.Plume)
	_next_without_feather.visible = not visible
