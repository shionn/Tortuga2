extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog("Parchemin", """Au nord, 
Après les monts qui forment la pair,
Non loin d'une forêt courbée,
Se tient ma demeure éternelle.
Non loin de là repose mon trésor, 
Mais à ma dernière énigme tu devras répondre.

4""")
