extends Node3D

@onready var _animation := $character/AnimationPlayer as AnimationPlayer
@onready var _name_3d := $name as Label3D
@onready var _gui := $"/root/World/Gui" as Control
@onready var _player := $"/root/World/Player" as Node3D
@onready var _player_camera := $"/root/World/Player/CameraPivot" as Node3D

const _name := "Maya"
const _dialog := """Bonjour aventurier,

Je vous sert quelque chose à boire ?
"""


func _ready() -> void:
	_name_3d.text = _name
	_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")

func _process(delta: float) -> void:
	_name_3d.look_at(_player.global_position, Vector3.UP, true)
	#_name_3d.set_global_rotate(Vector3.UP, _player_camera.global_rotation.y)

func _on_activation_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_activation_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_activation_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		_gui.openDialog(_name, _dialog)
