extends Control
class_name Bag

@onready var _grid = $Panel/MarginContainer/VBoxContainer/GridContainer as GridContainer
@onready var _items = $"../Items" as Control

var drag : Item

#@onready var _player = $"/root/World/Player" as Player

#func _ready() -> void:
#	_player.bag.connect("on_change", refresh_content)

#func refresh_content() -> void:
#	if visible :
#		for child in _grid.get_children() : 
#			_grid.remove_child(child)
#		for item : Item in _player.bag.items : 
#			_grid.add_child(_build_button_item(item))

func _on_visibility_changed() -> void:
	if visible :
		var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
		for id in JSON.parse_string(save_file.get_line()) :
			var i = _items.get_node(id)
			_items.remove_child(i)
			_grid.add_child(i)
#	refresh_content()
	pass


#func _build_button_item(item : Item) -> TextureButton : 
#	var but = TextureButton.new()
#	but.texture_normal = item.icon
#	item.connect_to(but)
#	return but
func loot(item : Item) -> void :
	_items.remove_child(item)
	_grid.add_child(item)

func _on_close_button_pressed() -> void:
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var ids = []
	for item in _grid.get_children() : ids.append(item.name)
	var json_string = JSON.stringify(ids)
	save_file.store_line(json_string)
	hide()
