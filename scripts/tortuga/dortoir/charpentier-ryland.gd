extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT)


const _TEXT = """Bonjour, je m’appelle Ryland. 

Je suis charpentier. Toutes les constructions du village sont mon œuvre. Et de temps en temps je construis des trucs pour permettre d'explorer plus loin. D'ailleurs ma dernière construction est juste derrière la montagne en face de moi.
"""
