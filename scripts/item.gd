extends TextureButton
class_name Item

@onready var _bag = $"../../Bag" as Bag

#static var drag : Item = null;

#@export var icon : Resource
	
#var button : TextureButton
var _interactable : Interactable


func _ready() -> void:
	set_default_cursor_shape(Control.CURSOR_POINTING_HAND)
	connect("pressed", on_activate)
	connect("button_down", _on_button_down)
	connect("button_up", _on_button_up)
	
#func connect_to(but : TextureButton) -> void :
#	button = but

func on_enter(interactable : Interactable) -> void :
	self._interactable = interactable
	set_default_cursor_shape(Control.CURSOR_CAN_DROP)

func on_exit(interactable : Interactable) -> void :
	if self._interactable == interactable :
		self._interactable = null
		set_default_cursor_shape(Control.CURSOR_DRAG)

func _on_button_down() -> void: 
	_bag.drag = self
	set_default_cursor_shape(Control.CURSOR_DRAG)

func _on_button_up() -> void: 
	if _interactable != null :
		_interactable.on_item_drop(self)
	_bag.drag = null
	set_default_cursor_shape(Control.CURSOR_POINTING_HAND)

func on_activate() -> void: 
	print("Item on_activate not implemented")
