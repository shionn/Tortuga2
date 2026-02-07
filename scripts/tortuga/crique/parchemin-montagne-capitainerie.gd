extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, _TEXT_1)
		.next(Dialog.playerSay(player, _TEXT_2)))

const _TEXT_1 = """Sur le parchemin il est écrit :
	[i]Bravo tu es allé déjà très loin,
	Le trésor est presque entre tes mains,
	Mais Barbe Drue était très malin,
	Depuis le mat tu vois loin,[/i]"""

const _TEXT_2 = """[i]	Mais le Tonneau de Rhum isolé,
	Tu devras retrouver,
	Auprès d'un étang il git,
	Va donc voir ce qu'il y est dit.
	7[/i]"""
