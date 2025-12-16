extends Control

@onready var _bag = $"../Bag" as Control

func _on_bag_button_pressed() -> void:
	_bag.show()
