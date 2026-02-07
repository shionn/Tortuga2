extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, _TEXT_1)
		.next(Dialog.playerSay(player, _TEXT_2)))

const _TEXT_1 = """Sur le parchemin il est écrit :
	[i]Au nord, 
	Après les monts qui forment la pair,
	Non loin d'une forêt courbée,[/i]"""

const _TEXT_2 = """	[i]Se tient ma demeure éternelle.
	Non loin de là repose mon trésor, 
	Mais à ma dernière énigme tu devras répondre.
	4[/i]"""
