extends TextureButton
class_name Item

@onready var _bag = $"../../Bag" as Bag
@onready var _gui = $"../.." as Gui
@onready var _player = $"/root/World/Player" as Player

@export_multiline var description: String
@export var image: Texture2D

var _interactable : Interactable

func _ready() -> void:
	set_default_cursor_shape(Control.CURSOR_POINTING_HAND)
	connect("pressed", on_activate)
	connect("button_down", _on_button_down)
	connect("button_up", _on_button_up)

#func _process(delta: float) -> void:
#	if name == "Melon" and global_position.x > 0:
#		print(global_position)

func on_enter(interactable : Interactable) -> void :
	self._interactable = interactable
	set_default_cursor_shape(Control.CURSOR_CAN_DROP)

func on_exit(interactable : Interactable) -> void :
	if self._interactable == interactable :
		self._interactable = null
		set_default_cursor_shape(Control.CURSOR_DRAG)

var _initial_position:Vector2

func _on_button_down() -> void: 
	_initial_position = global_position
	_bag.drag = self 
	set_default_cursor_shape(Control.CURSOR_DRAG)

func _on_button_up() -> void: 
	if _initial_position != null :
		global_position = _initial_position
	if _interactable != null :
		if _player.global_position.distance_to(_interactable.global_position) < _interactable.interactable_distance :
			_player.play_anim_interact()
			_interactable.on_item_drop(self)
		else :
			_player.play_anim_no()
			_gui.append_to_console("Trop loin")
	_bag.drag = null
	set_default_cursor_shape(Control.CURSOR_POINTING_HAND)

func on_activate() -> void: 
	if image :
		_gui.open_dialog_and_img(self.tooltip_text,self.description,image)
	else :
		_gui.open_dialog(self.tooltip_text, self.description)
	
