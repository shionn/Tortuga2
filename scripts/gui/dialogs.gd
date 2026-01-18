extends Object

class_name Dialogs

const question_search_forbid_fruit = "Je cherche le fruit défendu"
const question_search_forbid_fruit_montagn = "Je veux escalader la montagne"
const question_search_forbid_fruit_teleport = "Je cherche un crystal de téléportation"
const question_hung_connut_search_charpentier = "L'escalator au nord est détruit"
const question_hung_connut_search_wood = "J'ai besoin de bois"
const question_hung_connut_search_houblon = "J'ai besoin de houblon"
const question_missing_wind = "Il n’y a plus de vent"

static func default_search_forbid_fruit_option(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH) and not pnj.bag.contain(Bag.FruitDefendu),
		question_search_forbid_fruit,
		func(): pnj.gui.open_dialog(pnj.pnj_name, """Je n'en ai jamais entendu parler.""")
	)

static func default_search_forbid_fruit_montain_option(pnj : PNJ) -> PnjDialogOption : 
	return PnjDialogOption.new(
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE) and not pnj.bag.contain(Bag.FruitDefendu),
		question_search_forbid_fruit_montagn,
		func(): pnj.gui.open_dialog(pnj.pnj_name,"""Je ne sais pas comment faire.""")
	)

static func default_search_forbid_fruit_teleport_option(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) and not pnj.bag.contain(Bag.FruitDefendu),
		question_search_forbid_fruit_teleport,
		func(): pnj.gui.open_dialog(pnj.pnj_name, """Mais de quoi tu parles ?""")
	)

static func default_hung_connut_search_charpentier(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func (): return pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR) and pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER),
		question_hung_connut_search_charpentier,
		func(): pnj.gui.open_dialog(pnj.pnj_name, """Mince alors comment on va faire sans champignon ?""")
	)

static func default_hung_connut_search_wood(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func (): return pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_WOOD) and not pnj.bag.contain(Bag.BoisDeQualite),
		question_hung_connut_search_wood,
		func(): pnj.gui.open_dialog(pnj.pnj_name, _ANSWER_HUNG_CONNUT_SEARCH_WOOD)
	)

static func default_hung_connut_search_houblon(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func (): return pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) and not pnj.bag.contain(Bag.Houblon),
		question_hung_connut_search_houblon,
		func(): pnj.gui.open_dialog(pnj.pnj_name, _ANSWER_HUNG_CONNUT_SEARCH_HOUBLON)
	)

static func default_search_wind(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func (): return pnj.tags.have(Tags.SEARCH_WIND) and not pnj.tags.have(Tags.WIND_BLOWING),
		question_missing_wind,
		func(): pnj.gui.open_dialog(pnj.pnj_name, _ANWSER_NO_WIND)
	)

const _ANSWER_HUNG_CONNUT_SEARCH_WOOD = """Du bois ? Il y a des palmiers partout. 

Pourquoi tu ne demandes pas à Ryland notre charpentier ?"""

const _ANSWER_HUNG_CONNUT_SEARCH_HOUBLON = """Du houblon ? Ce qu’on utilise pour faire de la bière. 

C’est malin maintenant j’ai envie d’une bière, la bière rousse de Eve est la meilleure."""

const _ANWSER_NO_WIND = """Oui, cela fait plusieurs jours que ça dure. 

Ce n’est pas la première fois que ca arrive. Je ne sais pas comment mais le Capitaine a réussi à faire revenir les vents la dernière fois que cela s'était produit. """
