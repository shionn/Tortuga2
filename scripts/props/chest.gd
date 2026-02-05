extends Interactable

@export var _open = false

@onready var _animation = $chest/AnimationPlayer as AnimationPlayer

func _ready() -> void:
	super._ready()
	if _open:
		_animation.play()

func open() -> void : 
	if not _open :
		_open = true
		_animation.play("open")

func close() -> void : 
	if _open :
		_open = false
		_animation.play("close")
		
