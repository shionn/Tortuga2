extends CharacterBody3D

@onready var _camera := $"ship-pirate-large/Camera3D" as Camera3D
@onready var _activation := $activation as Area3D
@onready var _player := $"../Player" as CharacterBody3D
@onready var _player_camera := $"../Player/CameraPivot/StringArm3D/Camera3D" as Camera3D

func _physics_process(delta: float) -> void:
	if _activation.overlaps_body(_player) and Input.is_action_just_pressed("control_boat") :
		if _camera.current :
			_camera.clear_current()
		else :
			_camera.make_current()
	
	velocity -= velocity*.5*delta
	
	
	if _camera.current :
		_handle_move(delta)
	move_and_slide()

func _handle_move(delta : float) -> void: 
	if Input.is_action_pressed("ui_right") :
		rotate_y(-1*delta)
	if Input.is_action_pressed("ui_left") :
		rotate_y(1*delta)
	var dir = 0
	if Input.is_action_pressed("ui_up") :
		dir = 1
	if Input.is_action_pressed("ui_down") :
		dir = dir -1;
	if dir != 0: 
		var move := Vector3(0, 0, dir).rotated(Vector3.UP,global_rotation.y)
		move *= 10*delta
		velocity+=move
		
		
	
	
func _on_body_entered(body: Node3D) -> void:
	print("enter")


func _on_area_entered(area: Area3D) -> void:
	print("_on_area_entered")


func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	print("_on_body_shape_entered")
