extends "res://scripts/interactable.gd"

@export var character = ""
@onready var area := $Area3D as Area3D

func _ready() -> void:
	area.connect("mouse_entered", _on_mouse_entered)
	area.connect("mouse_exited", _on_mouse_exited)
	area.connect("input_event", _on_input_event)

func on_interact() -> void:
	Player.model = "res://assets/character/" + character
	get_tree().change_scene_to_file("res://world.tscn")
