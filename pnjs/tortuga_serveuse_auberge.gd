extends Node3D

@onready var _animation := $character/AnimationPlayer as AnimationPlayer
@onready var _gui := $"/root/World/Gui" as Control

const _dialog := """Bonjour aventurier,

Je vous sert quelque chose à boire ?
"""


func _ready() -> void:
	_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")

func _process(delta: float) -> void:
	pass

func _on_activation_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_activation_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_activation_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		_gui.openDialog(_dialog)
