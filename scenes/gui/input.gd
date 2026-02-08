extends Control

@onready var _panel = $Panel;
@onready var _richtextlabel = $Panel/MarginContainer/VBoxContainer/RichTextLabel
@onready var _line_edit = $Panel/MarginContainer/VBoxContainer/LineEdit

var _callback: Callable

func open(question: String, callback: Callable, _size: Vector2 = Vector2(300,110)) -> void : 
	_panel.set_size(size)
	_panel.offset_top=-_size.y/2
	_panel.offset_bottom=_size.y/2
	_panel.offset_left=-_size.x/2
	_panel.offset_right=_size.x/2

	_richtextlabel.clear()
	_richtextlabel.append_text(question)
	_line_edit.text = ""
	_callback = callback
	
	show()



func _on_validate_button_pressed() -> void:
	hide()
	_callback.call(_line_edit.text)
