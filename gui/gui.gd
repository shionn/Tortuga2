extends Control

@onready var _player := $"../Player" as CharacterBody3D
@onready var _debug_info := $DebugInfo as Label

@onready var _dialog := $Dialog as Control
@onready var _dialog_panel := $Dialog/Panel as Panel
@onready var _dialog_text := $Dialog/Panel/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_title := $Dialog/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _input := $Input as Control
@onready var _input_text := $Input/Panel/MarginContainer/VBoxContainer/LineEdit as LineEdit
@onready var _input_title := $Input/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _player_camera := $"../Player/CameraPivot" as Node3D
@onready var _compass_arrow := $Compass/Arrow as TextureRect

var callback : Callable

func open_dialog(title: String, text: String, size: Vector2 = Vector2(400,400)) -> void: 
	_dialog_panel.size = size
	_dialog_text.clear()
	_dialog_text.add_text(text)
	_dialog_title.text = title
	_dialog.show()

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


func _on_validate_input_button_pressed() -> void:
	_input.hide()
	callback.call(_input_text.text)
