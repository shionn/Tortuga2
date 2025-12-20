extends Node
class_name Interactable

@onready var gui := $"/root/World/Gui" as Gui
@onready var bag := $"/root/World/Gui/Bag" as Bag
@onready var _area := $Area3D as Area3D
@onready var player = $"/root/World/Player" as Player

@export var interactable_distance = 2 as float

func _ready() -> void:
	_area.connect("mouse_entered", _on_mouse_entered)
	_area.connect("mouse_exited", _on_mouse_exited)
	_area.connect("input_event", _on_input_event)

func on_interact() -> void: 
	print("on_interact is not overwrite")

func on_item_drop(item : Item) -> void: 
	open_alert("Oups", "Non ca ne marche pas")

func _on_mouse_entered() -> void:
	if bag and bag.drag != null:
		bag.drag.on_enter(self)
	else : 
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited() -> void:
	if bag and bag.drag != null:
		bag.drag.on_exit(self)
	else :
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		if player :
			if player.global_position.distance_to(self.global_position) < interactable_distance :
				on_interact()
			else :
				gui.append_to_console("Trop loin")
		else :
			on_interact()

# a supprimer
func open_text(title: String, text: String, size = Vector2(400,400)) -> void: 
	gui.open_dialog(title, text, size)

func open_alert(title: String, text: String) -> void: 
	gui.open_dialog(title, text, Vector2(300,200))

func open_dialog_and_img(title: String, text: String, img: Resource) -> void:
	gui.open_dialog_and_img(title, text, img)

func open_question(title: String, callback: Callable) -> void:
	gui.open_question(title,callback)
