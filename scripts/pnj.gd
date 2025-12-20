extends "res://scripts/interactable.gd"

@export var model : Resource
@export var pnj_name : String
@export var pnj_role = ""

@onready var _name_3d := $name as Label3D
@onready var _role_3d := $role as Label3D
@onready var _player_camera := $"/root/World/Player/CameraPivot/SpringArm3D/Camera3D" as Camera3D
@onready var _character := $character as Node3D

var _animation : AnimationPlayer

func _ready() -> void:
	super._ready()
	remove_child(_character)
	_character = model.instantiate()
	add_child(_character)
	
	_name_3d.text = pnj_name
	if pnj_role.is_empty() :
		_role_3d.text = ""
	else :
		_role_3d.text = "<"+pnj_role+">"
	
	_animation = _character.get_child(1)
	_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")

func _process(delta: float) -> void:
	_name_3d.look_at(_player_camera.global_position, Vector3.UP, true)
	_name_3d.rotation.x=0
	_name_3d.rotation.z=0
	_role_3d.rotation = _name_3d.rotation

func on_item_drop(item : Item) -> void:
	open_alert(pnj_name, "Je n'ai que faire de ça.")
