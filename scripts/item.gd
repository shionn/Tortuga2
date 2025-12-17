extends Node
class_name Item

static var drag : Item = null;

@export var icon : Resource
	
var button : TextureButton

func connect_to(but : TextureButton) -> void :
	button = but
	but.connect("pressed", on_activate)
	but.set_default_cursor_shape(Control.CURSOR_POINTING_HAND)
	#but.connect("mouse_entered", func (): but.set_default_cursor_shape(Control.CURSOR_POINTING_HAND))
	but.connect("button_down", _on_button_down)
	but.connect("button_up", _on_button_up)
	

func _on_button_down() -> void: 
	drag = self
	button.set_default_cursor_shape(Control.CURSOR_DRAG)

func _on_button_up() -> void: 
	drag = null
	button.set_default_cursor_shape(Control.CURSOR_POINTING_HAND)

func on_activate() -> void: 
	print("Item on_activate not implemented")
