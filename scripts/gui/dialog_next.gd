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
@onready var _close_butonn := $PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/CloseButton as Button

var _dialog : Dialog
var _option1 : DialogOption
var _option2 : DialogOption
var _option3 : DialogOption
var _option4 : DialogOption
var _option5 : DialogOption

func _process(_delta: float) -> void:
	if visible: 
		_player_camera.position = _player.global_position + _player.global_transform.basis*Vector3(-.2,0,.4) + Vector3(0,.6,0)
		_player_camera.look_at(_player.global_position + Vector3(0,.5,0), Vector3.UP, false)

		if _dialog and _dialog.pnj :
			_pnj_camera.position = _dialog.pnj.global_position + _dialog.pnj.global_transform.basis*Vector3(.2,0,.4) + Vector3(0,.6,0)
			_pnj_camera.look_at(_dialog.pnj.global_position + Vector3(0,.5,0), Vector3.UP, false)

func open(dialog : Dialog) -> void :
	_dialog = dialog
	_player_view.visible = _dialog.pnj == null
	_pnj_view.visible = _dialog.pnj != null
	_text.clear()
	_text.append_text(dialog.text)
	_option_button1.hide()
	_option_button2.hide()
	_option_button3.hide()
	_option_button4.hide()
	_option_button5.hide()
	for opt : DialogOption in dialog.options:
		if opt.condition.call():
			_set_option(opt)
	_close_butonn.visible = dialog.close
	show()

func _set_option(opt:DialogOption) -> void:
	if not _option_button1.visible:
		_option1 = opt
		_option_button1.text = opt.title
		_option_button1.show()
	elif not _option_button2.visible:
		_option2 = opt
		_option_button2.text = opt.title
		_option_button2.show()
	elif not _option_button3.visible:
		_option3 = opt
		_option_button3.text = opt.title
		_option_button3.show()
	elif not _option_button4.visible:
		_option4 = opt
		_option_button4.text = opt.title
		_option_button4.show()
	elif not _option_button5.visible:
		_option5 = opt
		_option_button5.text = opt.title
		_option_button5.show()


func _on_close_button_pressed() -> void:
	hide()
	if _dialog.on_close_action : _dialog.on_close_action.call()


func _on_option_button_1_pressed() -> void:
	self.hide()
	_option1.action.call()

func _on_option_button_2_pressed() -> void:
	self.hide()
	_option2.action.call()

func _on_option_button_3_pressed() -> void:
	self.hide()
	_option3.action.call()

func _on_option_button_4_pressed() -> void:
	self.hide()
	_option4.action.call()

func _on_option_button_5_pressed() -> void:
	self.hide()
	_option5.action.call()
