extends "res://scripts/pnj.gd"

func on_interact() -> void:
	open_text(pnj_name, """Ceci est la réserve d'or. 

Entrée interdite sans l'autorisation du Capitaine!""")
