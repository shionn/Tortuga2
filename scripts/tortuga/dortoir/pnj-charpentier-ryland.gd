extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self),
		PnjDialogOption.new(
			func (): return player.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE),
			Dialogs.question_search_forbid_fruit_montagn,
			func (): gui.open_dialog(pnj_name,_TEXT_SEACH_MONTAIN)
		),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		PnjDialogOption.new(
			func (): return player.tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR) and player.tags.have(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER),
			Dialogs.question_hung_connut_search_charpentier,
			_on_hung_connut_search_charpentier
		),
		PnjDialogOption.new(
			func (): return player.tags.have(Tags.HUNG_CONNUT_SEARCH_WOOD),
			Dialogs.question_hung_connut_search_wood,
			func (): gui.open_dialog(pnj_name,_TEXT_SEARCH_WOOD)
		),
		Dialogs.default_hung_connut_search_houblon(self)
	])

var quest_3_enable = true

func _on_hung_connut_search_charpentier() -> void:
	if quest_3_enable :
		gui.open_dialog(pnj_name, _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER_2)
		player.tags.add(Tags.HUNG_CONNUT_SEARCH_WOOD)
		player.tags.remove(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)
		player.tags.remove(Tags.HUNG_CONNUT_SEARCH_ESCALTOR)
	else :
		gui.open_dialog(pnj_name, _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER)
	gui.append_to_console("Félicitation, vous avez achevé la quête. Penser à sauvegarder.")


const _TEXT = """Bonjour, je m’appelle Ryland. 

Je suis charpentier. Toutes les constructions du village sont mon œuvre. Et de temps en temps je construis des trucs pour permettre d'explorer plus loin. D'ailleurs ma dernière construction est juste derrière la montagne en face de moi.
"""

const _TEXT_SEACH_MONTAIN = """Franchement moi je ne l'escaladerai pas, mais je construirais une structure pour atteindre le sommet. 

Enfin la montagne dont tu parle est tellement grande qu’il me faudrait peut être une vie entière pour y arriver. """

const _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER = """Quoi ? L’escalator du nord est détruit ? C'est une catastrophe ! Nous ne pouvons atteindre le sommet de la montagne ! On y trouve les meilleurs champignons.

Je vais le réparer mais il me faut du temps. Reviens dans quelque temps ca sera fait. 

Pour avancer plus loin, il nous faut accomplir une quête de peinture.
Pour prouvez que vous avez fini cette quête reporter le code \"Par Bois et Clou\" en message privé dans discord à Rurick alias Shionn."""

const _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER_2 = """Quoi ? L’escalator du nord est détruit ? C'est une catastrophe ! nous ne pouvons atteindre le sommet de la montagne ! On y trouve les meilleurs champignons.

Je vais le réparer mais il me faut des matériaux. Notamment du bois. Mais le bois de qualité se trouve en montagne. Le bois des palmiers n’est pas adapté pour ce type de construction. Donc pour aller chercher du bois il nous faut l’escalator, qui est cassé et pour le réparer il nous faut du bois. 

Il faut aller chercher le bois en dehors de l’île. Ramène m’en !"""

const _TEXT_SEARCH_WOOD = """Je t’ai dit que le bois de qualité pousse en montagne, mais l’escalator est cassé donc on ne peut pas aller chercher du bois. 

Il faut aller chercher le bois en dehors de l’île. Ramène m’en et je pourrai réparer l’escalator."""
