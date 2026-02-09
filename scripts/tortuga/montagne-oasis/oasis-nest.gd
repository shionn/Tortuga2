extends "res://scripts/interactable.gd"

@onready var _next_without_feather = $"../nest-without-feather" as Node3D

func on_interact() -> void:
	if bag.contain(Bag.ListInvocationVent):
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_2)
			.on_yes_no(func(): player.play_anim_no(), func():bag.loot(Bag.Plume))
		)
	else :
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_1))
		player.play_anim_no()

func on_item_change() -> void:	
	visible = not bag.contain(Bag.Plume)
	_next_without_feather.visible = not visible

const _TEXT_1 = """C'est une très jolie plume.

Au vu de la taille du nid, je ne m’amuserai pas à y toucher sans une bonne raison."""

const _TEXT_2 = """C'est une très jolie plume.

J’ai besoin d’une plume d’oiseau, est-ce que je me risque à la prendre ?"""
