extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var _camera := $CameraPivot/SpringArm3D/Camera3D as Camera3D
@onready var _camera_pivot := $CameraPivot as Node3D
@onready var _pivot := $Pivot as Node3D
@onready var _animation := $Pivot/character/AnimationPlayer as AnimationPlayer


@export_range(0.0, 1.0) var mouse_sensitivity = 0.01
@export var tilt_limit = deg_to_rad(75)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var cam_basis := _camera.get_global_transform().basis
	var direction := cam_basis * Vector3(input_dir.x, 0, input_dir.y)
	direction.y = 0
	direction = direction.normalized();
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		_pivot.rotation.y = atan2(direction.x,direction.z)
		if is_on_floor():
			_animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if is_on_floor(): 
			_animation.play("idle")
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		for anim in _animation.get_animation_list():
			print(anim)
		_animation.play("jump")
	if not is_on_floor() and velocity.y < -0.05:
		_animation.queue("fall")

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("move_camera"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event is InputEventMouseButton and Input.is_action_just_released("move_camera") :
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseMotion and Input.is_action_pressed("move_camera"):
		_camera_pivot.rotation.x -= event.relative.y * mouse_sensitivity
		# Prevent the camera from rotating too far up or down.
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
		_camera_pivot.rotation.y += -event.relative.x * mouse_sensitivity
