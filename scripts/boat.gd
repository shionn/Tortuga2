extends CharacterBody3D

@onready var _camera := $"ship-pirate-large/Camera3D" as Camera3D
@onready var _activation := $activation as Area3D
@onready var _player := $/root/World/Player as CharacterBody3D

var _speed := 0 as float

func _physics_process(delta: float) -> void:
	# Je desactive le control du bateau pour l'instant
	if Input.is_action_just_pressed("control_boat") && false :
		if _camera.current :
			_camera.clear_current()
		elif _activation.overlaps_body(_player) :
			_camera.make_current()
	
	_speed -= _speed*.5*delta
	
	
	if _camera.current :
		_handle_move(delta)
	if (abs(_speed)>.05): 
		velocity = Vector3(0, 0, _speed).rotated(Vector3.UP,global_rotation.y)
		move_and_slide()
		if (is_on_wall()) :
			_speed *=.5
	else : 
		velocity = Vector3.ZERO

func _handle_move(delta : float) -> void: 
	if Input.is_action_pressed("move_righ") :
		rotate_y(-1*delta)
		#velocity.rotated(Vector3.UP, -1*delta)
	if Input.is_action_pressed("move_left") :
		rotate_y(1*delta)
		#velocity.rotated(Vector3.UP, 1*delta)
	if Input.is_action_pressed("move_front") :
		_speed += 50.0*delta
	if Input.is_action_pressed("move_back") :
		_speed -= 50.0*delta


	#if abs(_speed) > 0.001 : 
		
	#	move *= 10*delta
	#	velocity+=move
		
		
	
	
func _on_body_entered(body: Node3D) -> void:
	print("enter")


func _on_area_entered(area: Area3D) -> void:
	print("_on_area_entered")


func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	print("_on_body_shape_entered")
