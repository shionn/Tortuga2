extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT)
	
	
const _TEXT = """Bonjour, je m'appel goustave ya.

Je peu te trouver n'importe qui qu'on ne trouve pas naturelement sur l'île.

T'aurais pas vu Kindle ? Comment ca tu connais Kindle ? Kindle ben c'est mon cheval pardi !"""
