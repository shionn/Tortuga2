extends "res://scripts/interactable.gd"

@onready var _item = $"/root/World/Items/test-item" as Item 
@onready var _player = $/root/World/Player as Player

func on_interact() -> void:
	_player.bag.loot(_item)
