extends Node3D

const SPEED := 5
const BOTTOM := .3
const UP := 50
var dir := Vector3.UP
@onready var _timer := $Timer as Timer

func _process(delta: float) -> void:
	if position.y <BOTTOM and dir.y < 0: 
		dir = Vector3.ZERO
		print("timer start")
		_timer.start(5)
	if position.y > UP and dir.y > 0 : 
		dir = Vector3.ZERO
		print("timer start")
		_timer.start(5)
	
	translate(SPEED*delta*dir)

func _on_timer_timeout():
	print("_on_timer_timeout")
	if position.y <BOTTOM : 
		dir = Vector3.UP
	if position.y > UP : 
		dir = Vector3.DOWN
