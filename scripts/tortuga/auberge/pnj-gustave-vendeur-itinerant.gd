extends "res://scripts/pnj.gd"

@onready var kindle = $"/root/World/Tortuga/Plage-O/Kindle" as PNJ

func on_interact() -> void:
	var text = _TEXT
	if tags.have(Tags.KINDLE_RETURN_GUSTAF) :
		text = _TEXT_AFTER_KINDLE_RETURN
	gui.open_dialog(pnj_name, text).with_options([
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
		),
		PnjDialogOption.new(
			func(): return tags.have(Tags.SEARCH_WIND) and not tags.have(Tags.WIND_BLOWING),
			Dialogs.question_missing_wind,
			func(): gui.open_dialog(pnj_name, _TEXT_SEARCH_WIND)
		)
	])
	
func on_item_drop(_item : Item) -> void:
	if _item.name == Bag.Houblon :
		gui.open_dialog(pnj_name, _TEST_SHOW_HOUBLON)
	else :
		super.on_item_drop(_item)

func _on_seach_wood() -> void:
	if tags.have(Tags.KINDLE_RETURN_GUSTAF) :
		gui.open_dialog(pnj_name, _TEXT_SEARCH_WOOD_AFTER_KINDLE)
		bag.loot(Bag.BoisDeQualite)
		tags.remove(Tags.HUNG_CONNUT_SEARCH_WOOD)
		play_anim_interact()
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

const _TEXT_AFTER_KINDLE_RETURN = """Merci de m’avoir rapporté kindle. 

Est-ce que je peux te vendre pour t’aider ?"""

const _TEXT_SEARCH_WOOD = """Et moi j’ai besoin de kindle, si tu me retrouves kindle je te donnerai le meilleurs bois possible.
Kindle est têtu il ne te suivra que si tu as de l’avoine avec toi."""

const _TEXT_SEARCH_WOOD_AFTER_KINDLE = """Pour te remercier de m’avoir rapporté kindle, je veux bien te donner une montagne de bois de qualitée. 

Mais après ça je considère avoir payé ma dette. """

const _TEXT_RETURN_KINDLE = """Merci ! Mille merci de m’avoir rapporté mon kindle ! 

Est-ce que je peux faire quelque chose pour toi ?"""

const _TEST_SHOW_HOUBLON = """Mon Kindle adore le houblon, il suivrait n’importe qui du moment que cette personne lui en montre."""

const _TEXT_SEARCH_WIND = """Du vent ? mais je n’en ai pas à vendre. J’ai cette espèce de truc ou on pompe dessus et ça souffle pour attiser le feu. 

Tu vois ce dont je parle ? Tu le veux ? je te le fait 5 pièces d’or ? Mais parce que t’es sympas, 4 ! Je vois que t'hésite, aller 3 pièces d’or ! 

Non ?"""
