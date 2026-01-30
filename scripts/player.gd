extends CharacterBody3D
class_name Player

static var model = ""

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

enum STATUT { MOVING, IDLE, SIT }

@onready var _camera := $CameraPivot/SpringArm3D/Camera3D as Camera3D
@onready var _camera_pivot := $CameraPivot as Node3D
@onready var _pivot := $Pivot as Node3D
@onready var _character := $Pivot/character as Node3D
@onready var tags := $Tags as Tags

var _animation : AnimationPlayer
var _last_floor_position : Vector3
var state = STATUT.MOVING
# start : 39, 1.5, -25

func sit(at_position : Vector3, look = 0.0) -> void: 
	state = STATUT.SIT
	position = at_position
	_animation.play("sit")
	_pivot.rotation.y = look

func teleport(at_position : Vector3, look = 0.0) -> void:
	position = at_position
	_pivot.rotation.y = look
	_camera_pivot.rotation.y = look + PI
	

func play_anim_interact() -> void:
	_animation.play("interact-right")
	if (state == STATUT.IDLE):
		_animation.queue("idle")

func play_anim_yes() -> void:
	_animation.play("emote-yes")
	if (state == STATUT.IDLE):
		_animation.queue("idle")

func play_anim_no() -> void:
	_animation.play("emote-no")
	if (state == STATUT.IDLE):
		_animation.queue("idle")


func _ready() -> void:
	var packed = load(model) as PackedScene
	var node = packed.instantiate() 
	if model.contains("keeper") || model.contains("vampire") : 
		node.position.y=-0.02
	_pivot.remove_child(_character)
	_pivot.add_child(node)
	_animation = node.get_child(1)
	_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	#teleport(Vector3(172.0,105.0,-253.0), 0) # oasis
	teleport(Vector3(229.7, 74, -270.7), 0) # montagne champi
	#teleport(Vector3(300, 26, -240), 72)
	#teleport(Vector3(257, 2, -316), -49) # escalator
	
func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
	elif position.y > -.5 :
		_last_floor_position = position
	
	if _camera.current :
		_handle_move()
		_handle_jump()

	move_and_slide()
	
	if is_on_floor() && position.y<-.5:
		position = position - get_position_delta()
	
	if position.y < -1 :
		position = _last_floor_position

	if Input.is_action_just_pressed("stuck") : teleport(Vector3(39, 1.5, -25), 0)
		

func _handle_move() -> void: 
	var input_dir := Input.get_vector("move_left", "move_righ", "move_front", "move_back")
	var cam_basis := _camera.get_global_transform().basis
	var direction := cam_basis * Vector3(input_dir.x, 0, input_dir.y)
	direction.y = 0
	direction = direction.normalized();
	
	if direction:
		state = STATUT.MOVING
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		_pivot.rotation.y = atan2(direction.x,direction.z)
		if is_on_floor():
			_animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if is_on_floor() && state == STATUT.MOVING : 
			state = STATUT.IDLE
			_animation.play("idle")

func _handle_jump() -> void :
	if Input.is_action_just_pressed("jump") and is_on_floor():
		state = STATUT.MOVING
		velocity.y = JUMP_VELOCITY
		_animation.play("jump")
	if not is_on_floor() and velocity.y < -0.05:
		_animation.queue("fall")

const tilt_limit = deg_to_rad(75)
const mouse_sensitivity = 0.01

var _previous_mouse_position : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("move_camera"):
		_previous_mouse_position = (event as InputEventMouseButton).position
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event is InputEventMouseButton and Input.is_action_just_released("move_camera") :
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Input.warp_mouse(_previous_mouse_position)
	elif event is InputEventMouseMotion and Input.is_action_pressed("move_camera"):
		_camera_pivot.rotation.x -= event.relative.y * mouse_sensitivity
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
		_camera_pivot.rotation.y += -event.relative.x * mouse_sensitivity
		
