extends "res://scripts/interactable.gd"

func on_interact() -> void:
	open_text("Menu", """
Café			1 pa
Biere			1 pa
Rhum			2 pa

Plat du Jour	4 pa
Spécialité		8 pa
""")
