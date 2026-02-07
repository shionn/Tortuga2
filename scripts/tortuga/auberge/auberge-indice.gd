extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(
		Dialog.playerSay(player, _TEXT_1).next(
			Dialog.playerSay(player,_TEXT_2).next(
				Dialog.playerSay(player,_TEXT_3))));


const _TEXT_1 = """Il est écrit : 
	[i]Sur l'Île que l'on nomme la Nouvelle Tortuga,
	Barbe Drue un ancien pirate a laissé ses pas,
	Mais pour trouver les chemins,
	Nul doute tu devras être malin,[/i]"""

const _TEXT_2 = """	[i]Au milieu de la baie,
	Sous la route de bois,
	Qui mène aux vaisseaux,
	Git une bouteille à l'eau,[/i]"""

const _TEXT_3 = """	[i]Elle cache dans son goulot, 
	Un indice pour trouver le chemin.

	8[/i]"""
