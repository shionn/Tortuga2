extends "res://scripts/interactable.gd"

@onready var orco = $"../pnj-orco" as PNJ

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, _DESCRIPTION)
		.next(Dialog.pnjSay(orco, _ORCO_DO_NOT_TOUCH))
	)
	
	
	
const _DESCRIPTION = "Sur la hache il est écrit : 

[i]Propriété de Kazrog[/i]"

const _ORCO_DO_NOT_TOUCH = "Ne touche pas à ça. 

Une hache, c'est sacrée."
