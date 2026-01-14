extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_alert("Tonneau rhum vide.", _TEXT)


const _TEXT= """Il s'agit d'un tonneau de rhum. 

Il est vide!"""
