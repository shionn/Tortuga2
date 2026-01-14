extends Node3D

@onready var _windmill = $windmill as Node3D
@onready var _tags = $"/root/World/Player/Tags" as Tags

var _rotating = false

func _ready() -> void:
	_tags.on_tag_change.connect(on_tag_change)

func _process(delta: float) -> void:
	if _rotating:
		_windmill.rotate_z(-delta*0.5)
	
func on_tag_change() -> void:
	visible = _tags.have(Tags.ESCALATOR_CHAMPI_REPAIR)
	_rotating = _tags.have(Tags.WIND_BLOWING)
