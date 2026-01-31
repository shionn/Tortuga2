extends Node3D

@onready var _tags = $"/root/World/Player/Tags" as Tags
@onready var _escalator = $AnimatableBody3D as Escalator

# utiliser aussi pour les pond de la montagnez
func _ready() -> void:
	_tags.on_tag_change.connect(on_tag_change)

func on_tag_change() -> void:
	visible = _tags.have(Tags.ESCALATOR_CHAMPI_REPAIR)
	if _escalator :
		_escalator.enable = _tags.have(Tags.WIND_BLOWING)
		_escalator.dir = Vector3.ZERO
	if visible :
		process_mode = Node.PROCESS_MODE_INHERIT
	else :
		process_mode = Node.PROCESS_MODE_DISABLED
