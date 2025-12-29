extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT)

const _TEXT = """Bonjour aventurier.ère, je suis le cartographe officiel du capitaine Whisp. 

Pas un seul endroit de cette île ne m'est inconnu. Les cartes n’ont aucun secret pour moi."""
