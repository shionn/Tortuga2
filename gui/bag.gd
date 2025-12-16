extends Control

@onready var _grid = $Panel/MarginContainer/VBoxContainer/GridContainer as GridContainer

func _on_visibility_changed() -> void:
	if visible :
		for child in _grid.get_children() : 
			_grid.remove_child(child)
		var b = TextureButton.new()
		b.texture_normal = load("res://assets/gui/fanatisy-magic-set/bag-h-48.png")
		_grid.add_child(b)
		print("refresh bag content")


func _on_close_button_pressed() -> void:
	hide()
