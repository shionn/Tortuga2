extends Node

@onready var _gui := $"/root/World/Gui" as Control

func on_interact() -> void: 
	pass

func open_text(title: String, text: String) -> void: 
	_gui.openDialog(title, text)

func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		on_interact()
