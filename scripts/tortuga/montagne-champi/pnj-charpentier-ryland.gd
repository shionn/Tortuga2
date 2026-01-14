extends "res://scripts/pnj.gd"

func on_interact() -> void:
	if tags.have(Tags.WIND_BLOWING) :
		gui.open_dialog(pnj_name, _TEXT_ESCALATOR_OK)
	else :
		gui.open_dialog(pnj_name, _TEXT_ESCALATOR_KO)
		tags.add(Tags.SEARCH_WIND)


const _TEXT_ESCALATOR_KO = """Salut, t’en as mis du temps pour me rejoindre ! 
Tellement que j’ai déjà fini les travaux. Mais on a un nouveau problème, cet escalator fonctionne grâce à la force du vent, et il n’y a plus la moindre brise. Donc ben il ne marche pas.

Je ne suis pas magicien, je ne suis pas capable de commander aux éléments."""

const _TEXT_ESCALATOR_OK = """Je ne sais pas comment mais d’un seul coup le vent est revenu. C’est ton œuvre ? 

L’escalator est pleinement fonctionnel."""
