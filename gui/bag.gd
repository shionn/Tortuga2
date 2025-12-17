extends Control

@onready var _grid = $Panel/MarginContainer/VBoxContainer/GridContainer as GridContainer
@onready var _player = $"/root/World/Player" as Player

func _on_visibility_changed() -> void:
	if visible :
		for child in _grid.get_children() : 
			_grid.remove_child(child)
		for item : Item in _player.bag.items : 
			_grid.add_child(_build_button_item(item))

func _build_button_item(item : Item) -> TextureButton : 
	var but = TextureButton.new()
	but.texture_normal = item.icon
	item.connect_to(but)
	return but

func _on_close_button_pressed() -> void:
	hide()
