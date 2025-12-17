extends "res://scripts/interactable.gd"

#@onready var _item = $"/root/World/Items/test-item" as Item 
#@onready var _player = $/root/World/Player as Player
@onready var _item = $"/root/World/Gui/Items/TestItem" as Control

func on_interact() -> void:
#	_player.bag.loot(_item)
	bag.loot(_item)
