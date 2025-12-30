extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog("Bouteille", """Cette bouteille contient une note. 

Bravo tu es valeureux et malin,
Mais cela ne suffira pas,
Car pour arpenter le chemin,
Robustes et forts seront tes pas !

Pour atteindre le Mat  à la cime de l'île,
Celui qui protège le trésor contre les êtres Vils,
Qui du butin voulaient s'emparer,
Barbe Drue sur le chemin d'un pas sûr devait rester.

3""")
