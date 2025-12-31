extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT)
	
	
const _TEXT = """Bonjour, je m'appelle Goustaf ya.

Je peux te trouver n'importe quoi qu'on ne trouve pas naturellement sur l'île.

T'aurais pas vu Kindle ? Comment ça ? Tu connais pas Kindle ? Kindle ben c'est mon cheval pardi !"""
