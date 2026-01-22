extends CharacterBody3D

class_name PNJ

@export var model : Resource
@export var pnj_name : String
@export var pnj_role = ""
@export var animation_name = "idle"
@export var animation_loop = true
@export var model_scale = 1.0
@export var interactable_distance = 3 as float
@export var text_y_offset = 0 as float

@onready var gui := $"/root/World/Gui" as Gui
@onready var bag := $"/root/World/Gui/Bag" as Bag
@onready var player = $"/root/World/Player" as Player
@onready var tags = $"/root/World/Player/Tags" as Tags
@onready var _area := $Area3D as Area3D
@onready var _name_3d := $name as Label3D
@onready var _role_3d := $role as Label3D
@onready var _player_camera := $"/root/World/Player/CameraPivot/SpringArm3D/Camera3D" as Camera3D
@onready var _character := $character as Node3D

@onready var _right_arm = $"right-arm"
@onready var _head = $head

var _animation : AnimationPlayer

func _ready() -> void:
	_area.connect("mouse_entered", _on_mouse_entered)
	_area.connect("mouse_exited", _on_mouse_exited)
	_area.connect("input_event", _on_input_event)

	if tags : tags.on_tag_change.connect(on_tag_change)
	if bag : bag.on_item_change.connect(on_item_change)

	remove_child(_character)
	_character = model.instantiate()
	if model_scale != 1 : _character.scale = Vector3(model_scale,model_scale,model_scale)
	add_child(_character)
	 
	if _right_arm:
		remove_child(_right_arm)
		_character.get_child(0).get_node("root/torso/arm-right").add_child(_right_arm)
	if _head:
		remove_child(_head)
		_character.get_child(0).get_node("root/torso/head").add_child(_head)
	
	_name_3d.text = pnj_name
	if pnj_role.is_empty() :
		_role_3d.text = ""
	else :
		_role_3d.text = "<"+pnj_role+">"
		
	if text_y_offset != 0:
		_name_3d.translate(Vector3(0,text_y_offset,0))
		_role_3d.translate(Vector3(0,text_y_offset,0))
	
	_animation = _character.get_child(1)
	var idle = _animation.get_animation("idle")
	if (idle) : idle.loop_mode = Animation.LOOP_LINEAR
	if animation_loop : _animation.get_animation(animation_name).loop_mode = Animation.LOOP_LINEAR
	_animation.play(animation_name)

func on_interact() -> void: 
	print("on_interact is not overwrite")

func on_item_drop(_item : Item) -> void:
	play_anim_no()
	gui.open_alert(pnj_name, "Je n'ai que faire de ça.")

func on_tag_change() -> void:
	pass

func on_item_change() -> void:
	pass

func play_anim_no() -> void : 
	_animation.play("emote-no")
	_animation.queue(animation_name)

func play_anim_yes() -> void : 
	_animation.play("emote-yes")
	_animation.queue(animation_name)

func play_anim_interact() -> void :
	_animation.play("interact-right")
	_animation.queue(animation_name)


func open_question(title: String, callback: Callable) -> void:
	gui.open_question(title,callback)


func _process(_delta: float) -> void:
	_name_3d.look_at(_player_camera.global_position, Vector3.UP, true)
	_name_3d.rotation.x=0
	_name_3d.rotation.z=0
	_role_3d.rotation = _name_3d.rotation

func _on_mouse_entered() -> void:
	if bag and bag.drag != null:
		bag.drag.on_enter(self)
	else : 
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited() -> void:
	if bag and bag.drag != null:
		bag.drag.on_exit(self)
	else :
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		if player :
			if player.global_position.distance_to(self.global_position) < interactable_distance :
				player.play_anim_interact()
				on_interact()
			else :
				player.play_anim_no()
				gui.append_to_console("Trop loin")
		else :
			on_interact()
