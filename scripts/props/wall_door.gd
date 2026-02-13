extends "res://scripts/interactable.gd"

@onready var door = $"wall-door2/wall-door/door"

const PI_2 = PI / 2
const SPEED = 3

@export var open = false

func on_interact() -> void:
	open = not open
	
func _physics_process(delta: float) -> void:
	if open and door.rotation.y < PI_2 :
		door.rotation.y = min(door.rotation.y + delta*SPEED, PI_2)
		_area.rotation.y = door.rotation.y
	elif not open and door.rotation.y > 0 :
		door.rotation.y = max(door.rotation.y - delta*SPEED, 0)
		_area.rotation.y = door.rotation.y
