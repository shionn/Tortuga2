extends "res://scripts/interactable.gd"

@export var model : Resource
@export var pnj_name : String

@onready var _name_3d := $name as Label3D
@onready var _player := $"/root/World/Player/CameraPivot/SpringArm3D/Camera3D" as Camera3D

var _animation : AnimationPlayer

func _ready() -> void:
	super._ready()
	var graphic = model.instantiate()
	add_child(graphic)
	
	_name_3d.text = pnj_name
	
	_animation = graphic.get_child(1)
	_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")

func _process(delta: float) -> void:
	_name_3d.look_at(_player.global_position, Vector3.UP, true)
	_name_3d.rotation.x=0
	_name_3d.rotation.z=0
