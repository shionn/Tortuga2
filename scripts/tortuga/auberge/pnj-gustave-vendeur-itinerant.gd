extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self), 
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		PnjDialogOption.new(
			func (): return tags.have(Tags.HUNG_CONNUT_SEARCH_WOOD),
			Dialogs.question_hung_connut_search_wood,
			_on_seach_wood
		)
	])

func _on_seach_wood() -> void:
	gui.open_dialog(pnj_name, _TEXT_SEARCH_WOOD)
	tags.add(Tags.HUNG_CONNUT_SEARCH_HOUBLON)
	
const _TEXT = """Bonjour, je m'appelle Goustaf ya.

Je peux te trouver n'importe quoi qu'on ne trouve pas naturellement sur l'île.

T'aurais pas vu Kindle ? Comment ça ? Tu connais pas Kindle ? Kindle ben c'est mon cheval pardi !"""

const _TEXT_SEARCH_WOOD = """TODO

Et moi j’ai besoin de kindle, si tu me retrouves kindle je te donnerai le meilleurs bois possible.
Kindle est têtu il ne te suivra que si tu as de l’avoine avec toi."""
