extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, """Sur le menu il est écrit : 

Boisson :		Café: 1 pa, Biere: 1 pa, Rhum: 2 pa, Cocktail: 4 pa
Nouriture :	Plat du Jour: 4 pa, Spécialité: 8 pa"""))
