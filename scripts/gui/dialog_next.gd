extends Panel
class_name  DialogNext

@onready var _player = $"/root/World/Player/Pivot" as Node3D
@onready var _player_camera = $MarginContainer/HBoxContainer/PlayerSubViewportContainer/SubViewport/Camera as Camera3D
@onready var _player_view = $MarginContainer/HBoxContainer/PlayerSubViewportContainer as SubViewportContainer
@onready var _pnj_camera = $MarginContainer/HBoxContainer/PnjSubViewportContainer/SubViewport/Camera as Camera3D
@onready var _pnj_view = $MarginContainer/HBoxContainer/PnjSubViewportContainer as SubViewportContainer
@onready var _text = $MarginContainer/HBoxContainer/VBoxContainer/RichTextLabel as RichTextLabel

var _pnj : PNJ

func _process(_delta: float) -> void:
	_player_camera.position = _player.global_position + _player.global_transform.basis*Vector3(-.2,0,.4) + Vector3(0,.6,0)
	_player_camera.look_at(_player.global_position + Vector3(0,.5,0), Vector3.UP, false)

	if _pnj :
		_pnj_camera.position = _pnj.global_position + _pnj.global_transform.basis*Vector3(.2,0,.4) + Vector3(0,.6,0)
		_pnj_camera.look_at(_pnj.global_position + Vector3(0,.5,0), Vector3.UP, false)

func open(text:String, pnj:PNJ = null) :
	_pnj = pnj
	_player_view.visible = _pnj == null
	_pnj_view.visible = _pnj != null
	_text.clear()
	_text.append_text(text)
	visible = true

func _on_close_button_pressed() -> void:
	visible = false
