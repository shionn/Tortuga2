extends Panel

class_name Dialog_Old

@onready var _dialog_text := $MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_title := $MarginContainer/VBoxContainer/Title as Label
@onready var _option_button1 := $MarginContainer/VBoxContainer/OptionButton1 as Button
@onready var _option_button2 := $MarginContainer/VBoxContainer/OptionButton2 as Button
@onready var _option_button3 := $MarginContainer/VBoxContainer/OptionButton3 as Button
@onready var _option_button4 := $MarginContainer/VBoxContainer/OptionButton4 as Button
@onready var _option_button5 := $MarginContainer/VBoxContainer/OptionButton5 as Button

var _callback1 : Callable
var _callback2 : Callable
var _callback3 : Callable
var _callback4 : Callable
var _callback5 : Callable

func open_dialog(title: String, text: String, _size: Vector2 = Vector2(400,400)) -> void: 
	self._open(title, text, _size)
	self.position.x = 10

func with_options(options: Array[PnjDialogOption] = []) -> Dialog_Old :
	for option in options :
		if option.enable.call() :
			set_option(option.title, option.action)
	return self

func open_alert(title: String, text: String, _size: Vector2 = Vector2(300,200)) -> void :
	self._open(title, text, _size)
	self.position.x = get_viewport_rect().size.x/2 - _size.x/2
	
func _open(title: String, text: String, _size: Vector2) -> void :
	self.set_size(size)
	self.offset_top=-_size.y/2
	self.offset_bottom=_size.y/2
	self.offset_left=-_size.x/2
	self.offset_right=_size.x/2
	_dialog_text.clear()
	_dialog_text.append_text(text)
	_dialog_title.text = title
	_option_button1.hide()
	_option_button2.hide()
	_option_button3.hide()
	_option_button4.hide()
	_option_button5.hide()
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
	elif not _option_button4.visible:
		_callback4 = callback
		_option_button4.text = text
		_option_button4.show()
	elif not _option_button5.visible:
		_callback5 = callback
		_option_button5.text = text
		_option_button5.show()

func _on_close() -> void:
	self.hide()

func _on_option_button_1_pressed() -> void:
	self.hide()
	_callback1.call()

func _on_option_button_2_pressed() -> void:
	self.hide()
	_callback2.call()

func _on_option_button_3_pressed() -> void:
	self.hide()
	_callback3.call()

func _on_option_button_4_pressed() -> void:
	self.hide()
	_callback4.call()

func _on_option_button_5_pressed() -> void:
	self.hide()
	_callback5.call()
