extends AnimatableBody3D

const SPEED := 5
const BOTTOM := 1.2
const UP := 72.8
var dir := Vector3.UP
@onready var _timer := $Timer as Timer


func _physics_process(delta: float) -> void:
	if position.y <BOTTOM and dir.y < 0: 
		#print("call up")
		dir = Vector3.ZERO
		#constant_linear_velocity = Vector3.UP
		_timer.start(5)
	if position.y > UP and dir.y > 0 : 
		#print("call down")
		dir = Vector3.ZERO
		#constant_linear_velocity = Vector3.DOWN
		_timer.start(5)
	global_translate(SPEED*dir*delta)
	

func _on_timer_timeout():
	#print("_on_timer_timeout ")
	#print(position.y)
	if position.y <BOTTOM : 
		#print("go up")
		dir = Vector3.UP
		#constant_linear_velocity = Vector3.UP
	if position.y > UP : 
		#print ("go down")
		dir = Vector3.DOWN
		#constant_linear_velocity = Vector3.DOWN
