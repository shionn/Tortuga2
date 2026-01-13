extends "res://scripts/pnj.gd"

@onready var kindle = $"/root/World/Tortuga/Plage-O/Kindle" as PNJ

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self), 
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		# TODO a partir de la quete 3 ajouter une opotion de dialog "kindle" ? qui debloquerai la recherche de Kindle sans rechercher le le bois
		PnjDialogOption.new(
			func (): return tags.have(Tags.HUNG_CONNUT_SEARCH_WOOD) and not bag.contain(Bag.BoisDeQualite),
			Dialogs.question_hung_connut_search_wood,
			_on_seach_wood
		),
		PnjDialogOption.new(
			func (): return kindle.follow && global_position.distance_to(kindle.global_position) < 10,
			"""Tiens c'est pas Kindle ?""",
			_on_return_kindle
		)
	])

func _on_seach_wood() -> void:
	if tags.have(Tags.KINDLE_RETURN_GUSTAF) :
		bag.loot(Bag.BoisDeQualite)
		tags.remove(Tags.HUNG_CONNUT_SEARCH_WOOD)
	else :
		gui.open_dialog(pnj_name, _TEXT_SEARCH_WOOD)
		tags.add(Tags.HUNG_CONNUT_SEARCH_HOUBLON)

func _on_return_kindle() -> void: 
	gui.open_dialog(pnj_name, _TEXT_RETURN_KINDLE)
	tags.add(Tags.KINDLE_RETURN_GUSTAF)
	tags.remove(Tags.HUNG_CONNUT_SEARCH_HOUBLON)
	bag.unloot(Bag.Houblon)

	
const _TEXT = """Bonjour, je m'appelle Goustaf ya.

Je peux te trouver n'importe quoi qu'on ne trouve pas naturellement sur l'île.

T'aurais pas vu Kindle ? Comment ça ? Tu connais pas Kindle ? Kindle ben c'est mon cheval pardi !"""

const _TEXT_SEARCH_WOOD = """TODO

Et moi j’ai besoin de kindle, si tu me retrouves kindle je te donnerai le meilleurs bois possible.
Kindle est têtu il ne te suivra que si tu as de l’avoine avec toi."""

const _TEXT_RETURN_KINDLE = """Merci ! Mille merci de m’avoir rapporté mon kindle ! 

Est-ce que je peux faire quelque chose pour toi ?"""
