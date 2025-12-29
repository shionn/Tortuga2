extends Panel

@onready var _dialog_text := $MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_title := $MarginContainer/VBoxContainer/Title as Label

func open_dialog(title: String, text: String, size: Vector2 = Vector2(400,400)) -> void: 
	self.set_size(size)
	self.offset_top=-size.y/2
	self.offset_bottom=size.y/2
	self.offset_left=-size.x/2
	self.offset_right=size.x/2
	_dialog_text.clear()
	_dialog_text.add_text(text)
	_dialog_title.text = title
	self.show()

func _on_close() -> void:
	self.hide()
