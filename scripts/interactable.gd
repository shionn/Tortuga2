extends Node3D
class_name Interactable

@onready var gui := $"/root/World/Gui" as Gui
@onready var bag := $"/root/World/Gui/Bag" as Bag
@onready var _area := $Area3D as Area3D
@onready var player = $"/root/World/Player" as Player
@onready var tags = $"/root/World/Player/Tags" as Tags

@export var interactable_distance = 3 as float

func _ready() -> void:
	_area.connect("mouse_entered", _on_mouse_entered)
	_area.connect("mouse_exited", _on_mouse_exited)
	_area.connect("input_event", _on_input_event)
	if tags : tags.on_tag_change.connect(on_tag_change)
	if bag : bag.on_item_change.connect(on_item_change)

func on_interact() -> void: 
	print("on_interact is not overwrite")

func on_item_drop(_item : Item) -> void: 
	player.play_anim_no()
	gui.open_alert("Oups", "Non ca ne marche pas")

func on_tag_change() -> void:
	pass

func on_item_change() -> void:
	pass

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

func _on_input_event(_camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("interact"): 
		if player :
			if player.global_position.distance_to(self.global_position) < interactable_distance :
				player.play_anim_interact()
				on_interact()
			else :
				player.play_anim_no()
				gui.append_to_console("Trop loin")
		else :
			on_interact()

func open_dialog_and_img(title: String, text: String, img: Resource) -> void:
	gui.open_dialog_and_img(title, text, img)

func open_question(title: String, callback: Callable) -> void:
	gui.open_question(title,callback)
