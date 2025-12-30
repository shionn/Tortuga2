extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog("Menu", """
Café			1 pa
Biere			1 pa
Rhum			2 pa

Plat du Jour	4 pa
Spécialité		8 pa
""")
