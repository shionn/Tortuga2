extends Control
class_name Bag

@onready var _grid = $Panel/MarginContainer/VBoxContainer/GridContainer as GridContainer
@onready var _items = $"../Items" as Control
@onready var _console = $"../Console/RichTextLabel" as RichTextLabel

var drag : Item



func _on_visibility_changed() -> void:
	pass

func loot(item : Item) -> void :
	if _items.is_ancestor_of(item) :
		_items.remove_child(item)
		_grid.add_child(item)
		_console.append_text("Vous obtenez <"+item.tooltip_text+">")
		_console.newline()
	else :
		print("bordel")
		print(item)

func _on_close_button_pressed() -> void:
	hide()

func save() -> void :
	var file = FileAccess.open("user://bag.save", FileAccess.WRITE)
	var item_names = []
	for item in _grid.get_children() : item_names.append(item.name)
	var json_string = JSON.stringify(item_names)
	file.store_line(json_string)

func load() -> void : 
	var file = FileAccess.open("user://bag.save", FileAccess.READ)
	for item_name in JSON.parse_string(file.get_line()) :
		var item = _items.get_node(item_name)
		_items.remove_child(item)
		_grid.add_child(item)
