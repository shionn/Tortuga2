extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, _TEXT_1)
		.next(Dialog.playerSay(player, _TEXT_2)))

const _TEXT_1 = """Cette bouteille contient une note :
[i]	Bravo tu es valeureux et malin,
	Mais cela ne suffira pas,
	Car pour arpenter le chemin,
	Robustes et forts seront tes pas ![/i]"""

const _TEXT_2 = """[i]	Pour atteindre le mât à la cime de l'île,
	Celui qui protège le trésor contre les êtres Vils,
	Qui du butin voulaient s'emparer,
	Barbe Drue sur le chemin d'un pas sûr devait rester.
3[/i]"""
