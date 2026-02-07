extends GridContainer
class_name  DialogNext

@onready var _player = $"/root/World/Player/Pivot" as Node3D
@onready var _player_camera = $PanelContainer/HBoxContainer/PlayerSubViewportContainer/SubViewport/Camera as Camera3D
@onready var _player_view = $PanelContainer/HBoxContainer/PlayerSubViewportContainer as SubViewportContainer
@onready var _pnj_camera = $PanelContainer/HBoxContainer/PnjSubViewportContainer/SubViewport/Camera as Camera3D
@onready var _pnj_view = $PanelContainer/HBoxContainer/PnjSubViewportContainer as SubViewportContainer
@onready var _text = $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _option_button1 := $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton1 as Button
@onready var _option_button2 := $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton2 as Button
@onready var _option_button3 := $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton3 as Button
@onready var _option_button4 := $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton4 as Button
@onready var _option_button5 := $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton5 as Button


var _pnj : PNJ
var _callback1 : Callable
var _callback2 : Callable
var _callback3 : Callable
var _callback4 : Callable
var _callback5 : Callable

func _process(_delta: float) -> void:
	_player_camera.position = _player.global_position + _player.global_transform.basis*Vector3(-.2,0,.4) + Vector3(0,.6,0)
	_player_camera.look_at(_player.global_position + Vector3(0,.5,0), Vector3.UP, false)

	if _pnj :
		_pnj_camera.position = _pnj.global_position + _pnj.global_transform.basis*Vector3(.2,0,.4) + Vector3(0,.6,0)
		_pnj_camera.look_at(_pnj.global_position + Vector3(0,.5,0), Vector3.UP, false)

func open(text:String, pnj:PNJ = null) -> void :
	_pnj = pnj
	_player_view.visible = _pnj == null
	_pnj_view.visible = _pnj != null
	_text.clear()
	_text.append_text(text)
	_option_button1.hide()
	_option_button2.hide()
	_option_button3.hide()
	_option_button4.hide()
	_option_button5.hide()
	show()

func with_options(options: Array[PnjDialogOption] = []) -> DialogNext :
	for option in options :
		if option.enable.call() :
			_set_option(option.title, option.action)
	return self

func _set_option(text:String, callback: Callable) -> void:
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


func _on_close_button_pressed() -> void:
	hide()


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
