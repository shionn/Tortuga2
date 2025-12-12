extends Node

@onready var _gui := $"/root/World/Gui" as Control
@onready var area := $Area3D as Area3D

func _ready() -> void:
	area.connect("mouse_entered", _on_mouse_entered)
	area.connect("mouse_exited", _on_mouse_exited)
	area.connect("input_event", _on_input_event)

func on_interact() -> void: 
	print("on_interact is not overwrite")

func open_text(title: String, text: String, size = Vector2(400,400)) -> void: 
	_gui.open_dialog(title, text, size)

func open_alert(title: String, text: String) -> void: 
	_gui.open_dialog(title, text, Vector2(250,150))

func open_dialog_and_img(title: String, text: String, img: Resource) -> void:
	_gui.open_dialog_and_img(title, text, img)

func open_question(title: String, callback: Callable) -> void:
	_gui.open_question(title,callback)

func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		on_interact()
