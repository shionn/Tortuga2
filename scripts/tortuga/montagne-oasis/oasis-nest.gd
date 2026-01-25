extends "res://scripts/interactable.gd"

@onready var _next_without_feather = $"../nest-without-feather" as Node3D

func on_interact() -> void:
	if bag.contain(Bag.ListInvocationVent):
		bag.loot(Bag.Plume)
	else :
		player.play_anim_no()
		gui.open_alert("non", "Au vu de la taille du nid, je ne m’amuserai pas à y toucher sans une bonne raison.")

func on_item_change() -> void:	
	visible = not bag.contain(Bag.Plume)
	_next_without_feather.visible = not visible
