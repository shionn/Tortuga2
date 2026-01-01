extends Panel

class_name Dialog

@onready var _dialog_text := $MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_title := $MarginContainer/VBoxContainer/Title as Label
@onready var _option_button1 := $MarginContainer/VBoxContainer/OptionButton1 as Button
@onready var _option_button2 := $MarginContainer/VBoxContainer/OptionButton2 as Button
@onready var _option_button3 := $MarginContainer/VBoxContainer/OptionButton3 as Button

var _callback1 : Callable
var _callback2 : Callable
var _callback3 : Callable

func open_dialog(title: String, text: String, size: Vector2 = Vector2(400,400)) -> void: 
	self._open(title, text, size)
	self.position.x = 10

func open_alert(title: String, text: String, size: Vector2 = Vector2(300,200)) -> void :
	self._open(title, text, size)
	self.position.x = get_viewport_rect().size.x/2 - size.x/2
	
func _open(title: String, text: String, size: Vector2) -> void :
	self.set_size(size)
	self.offset_top=-size.y/2
	self.offset_bottom=size.y/2
	self.offset_left=-size.x/2
	self.offset_right=size.x/2
	_dialog_text.clear()
	_dialog_text.add_text(text)
	_dialog_title.text = title
	_option_button1.hide()
	_option_button2.hide()
	_option_button3.hide()
	self.show()
	

func set_option(text:String, callback: Callable) -> void:
	if not _option_button1.visible:
		_callback1 = callback
		_option_button1.text = text
		_option_button1.show()
	elif not _option_button2.visible:
		_callback2 = callback
		_option_button2.text = text
		_option_button2.show()
	elif not _option_button3.visible:
		_callback3 = callback
		_option_button3.text = text
		_option_button3.show()

func _on_close() -> void:
	self.hide()

func _on_option_button_1_pressed() -> void:
	_callback1.call()
	self.hide()

func _on_option_button_2_pressed() -> void:
	_callback2.call()
	self.hide()

func _on_option_button_3_pressed() -> void:
	_callback3.call()
	self.hide()
