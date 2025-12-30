extends "res://scripts/interactable.gd"

@export var title : String = "Panneau"
@export_multiline var text : String

func on_interact() -> void:
	gui.open_alert(title, text)
