extends Node3D

@onready var _character := $character as Node3D
@onready var _animation := $character/AnimationPlayer as AnimationPlayer
@onready var _name_3d := $name as Label3D
@onready var _gui := $"/root/World/Gui" as Control
@onready var _player := $"/root/World/Player" as Node3D

var _pnj_name := "not set"
var _pnj_dialog := "not set"

func _ready() -> void:
	_name_3d.text = _pnj_name
	_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")
	
func _process(delta: float) -> void:
	_name_3d.look_at(_player.global_position, Vector3.UP, true)
	_name_3d.rotation.x=0
	_name_3d.rotation.z=0

func _on_activation_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_activation_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_activation_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		_gui.open_dialog(_pnj_name, _pnj_dialog)
