extends AnimatableBody3D

const SPEED := 5
@onready var _timer := $Timer as Timer

var start := 0
@export var end := 10.0
@export var enable := true
var dir := Vector3.UP

func _physics_process(delta: float) -> void:
	if enable :
		if position.y < start and dir.y < 0: 
			dir = Vector3.ZERO
			_timer.start(5)
		if position.y > end and dir.y > 0 : 
			dir = Vector3.ZERO
			_timer.start(5)
	else :
		dir = Vector3.ZERO
	global_translate(SPEED*dir*delta)
	

func _on_timer_timeout():
	if position.y < start : 
		dir = Vector3.UP
	if position.y > end : 
		dir = Vector3.DOWN
