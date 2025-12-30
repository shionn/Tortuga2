extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name,"""Qu'est ce que tu me veux ? 

Si tu cherches le menu, il est placardé aux murs.""")
