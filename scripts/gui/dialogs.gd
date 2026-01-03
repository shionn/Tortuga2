extends Object

class_name Dialogs

const question_search_forbid_fruit = "Je cherche le fruit défendu"
const question_search_forbid_fruit_montagn = "Je veux escalader la montagne"
const question_search_forbid_fruit_teleport = "Je cherche un crystal de téléportation"
const question_hung_connut_search_charpentier = "L'escalator au nord est détruit"

static func default_search_forbid_fruit_option(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func(): return pnj.player.tags.have(Tags.FORBID_FRUIT_SEARCH),
		question_search_forbid_fruit,
		func(): pnj.gui.open_dialog(pnj.pnj_name, """Je n'en ai jamais entendu parler.""")
	)

static func default_search_forbid_fruit_montain_option(pnj : PNJ) -> PnjDialogOption : 
	return PnjDialogOption.new(
		func(): return pnj.player.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE),
		question_search_forbid_fruit_montagn,
		func(): pnj.gui.open_dialog(pnj.pnj_name,"""Je ne sais pas comment faire.""")
	)

static func default_search_forbid_fruit_teleport_option(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func(): return pnj.player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT),
		question_search_forbid_fruit_teleport,
		func(): pnj.gui.open_dialog(pnj.pnj_name, """Mais de quoi tu parles ?""")
	)

static func default_hung_connut_search_charpentier(pnj : PNJ) -> PnjDialogOption :
	return PnjDialogOption.new(
		func (): return pnj.player.tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR) and pnj.player.tags.have(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER),
		question_hung_connut_search_charpentier,
		func(): pnj.gui.open_dialog(pnj.pnj_name, """Mince alors comment on va faire sans champignon ?""")
	)
