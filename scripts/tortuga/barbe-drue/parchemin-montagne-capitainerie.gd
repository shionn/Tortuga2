extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog("Parchemin", """Bravo tu es allé déjà très loin,
Le trésor est presque entre tes mains,
Mais Barbe Drue était très malin,
Depuis le mat tu vois loin,
Mais le Tonneau de Rhum isolé,
Tu devras retrouver,
Auprès d'un étang il git,
Va donc voir ce qu'il y est dit.

7""")
