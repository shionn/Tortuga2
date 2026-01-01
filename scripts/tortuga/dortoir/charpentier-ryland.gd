extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self),
		PnjDialogOption.new(
			func (): return player.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE),
			Dialogs.question_search_forbid_fruit_montagn,
			func (): gui.open_dialog(pnj_name,_TEXT_SEACH_MONTAIN)
		),
		Dialogs.default_search_forbid_fruit_teleport_option(self)
	])


const _TEXT = """Bonjour, je m’appelle Ryland. 

Je suis charpentier. Toutes les constructions du village sont mon œuvre. Et de temps en temps je construis des trucs pour permettre d'explorer plus loin. D'ailleurs ma dernière construction est juste derrière la montagne en face de moi.
"""

const _TEXT_SEACH_MONTAIN = """Franchement moi je ne l'escaladerai pas, mais je construirais une structure pour atteindre le sommet. 

Enfin la montagne dont tu parle est tellement grande qu’il me faudrait peut être une vie entière pour y arriver. """
