extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog("Parchemin", """Sur l'Île que l'on nomme la Nouvelle Tortuga,
Barbe Drue un ancien pirate a laissé ses pas,
Mais pour trouver les chemins,
Nul doute tu devras être malin,
Au milieu de la baie,
Sous la route de bois,
Qui mène aux vaisseaux,
Git une bouteille à l'eau,
Elle cache dans son goulot,
Un indice pour trouver le chemin.

8""")
