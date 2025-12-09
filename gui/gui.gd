extends Control

@onready var _player := $"../Player" as CharacterBody3D
@onready var _debug_info := $DebugInfo as Label

@onready var _dialog := $Dialog as Panel
@onready var _dialog_text := $Dialog/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_title := $Dialog/MarginContainer/VBoxContainer/Title as Label

@onready var _dialog_img := $DialogAndImg as Control
@onready var _dialog_img_text := $DialogAndImg/Panel/MarginContainer/VBoxContainer/HBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_img_img := $DialogAndImg/Panel/MarginContainer/VBoxContainer/HBoxContainer/TextureRect as TextureRect
@onready var _dialog_img_title := $DialogAndImg/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _input := $Input as Control
@onready var _input_text := $Input/Panel/MarginContainer/VBoxContainer/LineEdit as LineEdit
@onready var _input_title := $Input/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _player_camera := $"../Player/CameraPivot" as Node3D
@onready var _compass_arrow := $Compass/Arrow as TextureRect

var callback : Callable

func open_dialog(title: String, text: String, size: Vector2 = Vector2(400,400)) -> void: 
	_dialog.set_size(size)
	_dialog.offset_top=-size.y/2
	_dialog.offset_bottom=size.y/2
	_dialog.offset_left=-size.x/2
	_dialog.offset_right=size.x/2
	_dialog_text.clear()
	_dialog_text.add_text(text)
	_dialog_title.text = title
	_dialog.show()
	print("aze")

func open_dialog_and_img(title: String, text: String, img: Resource) -> void:
	_dialog_img_text.clear()
	_dialog_img_text.add_text(text)
	_dialog_img_title.text = title
	_dialog_img_img.texture = img
	_dialog_img.show()

func open_question(title: String, callback: Callable) -> void:
	_input_title.text = title
	_input_text.text = ""
	_input.show()
	self.callback = callback

func _process(delta: float) -> void:
	_debug_info.text = str(_player.global_position)
	_debug_info.text += "\nfps: " + str(Engine.get_frames_per_second())
	_compass_arrow.rotation = -_player_camera.rotation.y

func _on_close_dialog_button_pressed() -> void:
	_dialog.hide()

func _on_close_dialog_and_img_button_pressed() -> void:
	_dialog_img.hide()


func _on_validate_input_button_pressed() -> void:
	_input.hide()
	callback.call(_input_text.text)
