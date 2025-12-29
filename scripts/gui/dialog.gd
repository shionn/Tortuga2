extends Panel

class_name Dialog

@onready var _dialog_text := $MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_title := $MarginContainer/VBoxContainer/Title as Label
@onready var _option_button := $MarginContainer/VBoxContainer/OptionButton as Button

var callback : Callable

func open_dialog(title: String, text: String, size: Vector2 = Vector2(400,400)) -> void: 
	self.set_size(size)
	self.offset_top=-size.y/2
	self.offset_bottom=size.y/2
	self.offset_left=-size.x/2
	self.offset_right=size.x/2
	_dialog_text.clear()
	_dialog_text.add_text(text)
	_dialog_title.text = title
	_option_button.hide()
	self.show()

func set_option(text:String, callback: Callable) -> void:
	self.callback = callback
	_option_button.text = text
	_option_button.show()

func _on_close() -> void:
	self.hide()


func _on_option_button_pressed() -> void:
	callback.call()
