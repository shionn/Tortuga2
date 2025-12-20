extends Control

@onready var _bag = $"../Bag" as Control

func _on_bag_button_pressed() -> void:
	if _bag.visible : _bag.hide()
	else : _bag.show()
