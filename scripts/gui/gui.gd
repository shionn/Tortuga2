extends Control
class_name Gui

@onready var _player := $"../Player" as Player
@onready var _debug_info := $DebugInfo as Label

@onready var _dialog := $Dialog as Panel

@onready var _dialog_img := $DialogAndImg as Control
@onready var _dialog_img_text := $DialogAndImg/Panel/MarginContainer/VBoxContainer/HBoxContainer/RichTextLabel as RichTextLabel
@onready var _dialog_img_img := $DialogAndImg/Panel/MarginContainer/VBoxContainer/HBoxContainer/TextureRect as TextureRect
@onready var _dialog_img_title := $DialogAndImg/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _input := $Input as Control
@onready var _input_text := $Input/Panel/MarginContainer/VBoxContainer/LineEdit as LineEdit
@onready var _input_title := $Input/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _input_yn := $InputYesNo as Control
@onready var _input_yn_text := $InputYesNo/Panel/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _input_yn_title := $InputYesNo/Panel/MarginContainer/VBoxContainer/Title as Label

@onready var _console := $Console/Panel/RichTextLabel as RichTextLabel

@onready var _player_camera := $"../Player/CameraPivot" as Node3D
@onready var _compass_arrow := $Compass/Arrow as TextureRect

var callback : Callable
var callback_no : Callable
var callback_yes : Callable

func append_to_console(text: String) -> void:
	_console.append_text(text)
	_console.newline()

func open_dialog(title: String, text: String, size: Vector2 = Vector2(400,400)) -> Dialog: 
	_dialog.open_dialog(title, text, size)
	return _dialog

func open_alert(title: String, text: String, size: Vector2 = Vector2(300,200)) -> Dialog: 
	_dialog.open_alert(title, text, size)
	return _dialog

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

func open_yes_no_question(title: String, question: String, on_no: Callable, on_yes: Callable) -> void:
	_input_yn_title.text = title
	_input_yn_text.clear()
	_input_yn_text.add_text(question)
	self.callback_no = on_no
	self.callback_yes = on_yes
	_input_yn.show()

func _process(delta: float) -> void:
	_debug_info.text = str(_player.global_position) + " " + str(rad_to_deg(_player._pivot.rotation.y))
	_debug_info.text += "\nfps: " + str(Engine.get_frames_per_second())
	_compass_arrow.rotation = -_player_camera.rotation.y
	if Input.is_action_just_pressed("debug") :
		append_to_console(str(_player.tags.tags))

func _on_close_dialog_and_img_button_pressed() -> void:
	_dialog_img.hide()

func _on_validate_input_button_pressed() -> void:
	_input.hide()
	callback.call(_input_text.text)

func _on_no_button_pressed() -> void:
	_input_yn.hide()
	_player.play_anim_no()
	self.callback_no.call()

func _on_yes_button_pressed() -> void:
	_input_yn.hide()
	_player.play_anim_yes()
	self.callback_yes.call()
