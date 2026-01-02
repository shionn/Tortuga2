extends Control

@onready var _title = $Panel/MarginContainer/VBoxContainer/Title
@onready var _texture = $Panel/MarginContainer/VBoxContainer/TextureRect

func open(title: String, img: Resource) -> void:
	_title.text = title
	_texture.texture = img
	show()


func _on_close_dialog_button_pressed() -> void:
	hide()
