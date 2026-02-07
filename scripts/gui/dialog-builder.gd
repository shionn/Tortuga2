extends Object
class_name Dialog

var text: String
var options: Array[DialogOption] = []
var pnj: PNJ
var _gui: Gui
var close: bool = true
var on_close_action: Callable

static func pnjSay(_pnj: PNJ, _text: String) -> Dialog :
	var d = Dialog.new()
	d.pnj = _pnj
	d._gui = _pnj.gui
	d.text = _text
	return d

static func playerSay(_player: Player,_text: String) -> Dialog:
	var d = Dialog.new()
	d.text = _text
	d._gui = _player._gui
	return d
	
func option(_option:DialogOption) -> Dialog:
	options.append(_option)
	return self

func option_action(_title: String, _action: Callable, _condition: Callable = func(): return true) -> Dialog:
	return option(DialogOption.new(_title, _action, _condition))

func option_dialog(_title: String, _another: Dialog, _condition: Callable = func(): return true) -> Dialog:
	return option_action(_title, func(): _gui.open_dialog_next(_another), _condition)

func next(another : Dialog) -> Dialog :
	close = false
	return option_action("Suite...", func(): _gui.open_dialog_next(another))

func on_close(_action: Callable) -> Dialog :
	on_close_action = _action
	return self

## Les dialog par defaut

func option_search_forbid_fruit() -> Dialog :
	return option_dialog("Fruit défendu ?", 
		playerSay(pnj.player,  "Je cherche le fruit défendu. Est-ce que tu en as déjà entendu parler ?").next(
			pnjSay(pnj, """Je n'en ai jamais entendu parler.""")),
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH) and not pnj.bag.contain(Bag.FruitDefendu)
	)

func option_search_forbid_fruit_montain() -> Dialog : 
	return option_dialog("Escalader la montagne ?", 
		playerSay(pnj.player, "Je veux escalader la plus grande montagne de l'île. Sais tu comment faire ?").next(
			pnjSay(pnj, """Je ne sais pas comment faire.""")),
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE) and not pnj.bag.contain(Bag.FruitDefendu)
	)

func option_search_forbid_fruit_montain_teleport() -> Dialog : 
	return option_dialog("Crystal de téléportation ?", 
		playerSay(pnj.player, "Je cherche un crystal de téléportation.").next(
			pnjSay(pnj, """Mais de quoi tu parles ?""")),
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) and not pnj.bag.contain(Bag.FruitDefendu)
	)

func option_hung_connut_search_charpentier() -> Dialog : 
	return option_dialog("L'escalator détruit ?", 
		playerSay(pnj.player, "L'escalator au nord est détruit. Sais-tu comment faire pour le réparer ?").next(
			pnjSay(pnj, """Quoi l'escalator est détruit ? C'est une catastrophe ! Comment on va faire sans champignon ?""")),
		func (): return pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR) and pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)
	)

func option_hung_connut_search_wood() -> Dialog : 
	return option_dialog("Du bois ?", 
		playerSay(pnj.player, "J'ai besoin de bois. Sais-tu ou en trouver ?").next(
			pnjSay(pnj, _ANSWER_HUNG_CONNUT_SEARCH_WOOD)),
		func (): return pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_WOOD) and not pnj.bag.contain(Bag.BoisDeQualite)
	)

func option_hung_connut_search_houblon() -> Dialog : 
	return option_dialog("Du houblon ?", 
		playerSay(pnj.player, "J'ai besoin de houblon. Sais-tu ou en trouver ?").next(
			pnjSay(pnj, _ANSWER_HUNG_CONNUT_SEARCH_HOUBLON)),
		func (): return pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) and not pnj.bag.contain(Bag.Houblon)
	)

func option_search_wind() -> Dialog :
	return option_dialog("Absence du vent ?", 
		playerSay(pnj.player,  "Il n’y a plus de vent.").next(
			pnjSay(pnj, _ANWSER_NO_WIND)),
		func (): return pnj.tags.have(Tags.SEARCH_WIND) and not pnj.tags.have(Tags.WIND_BLOWING)
	)

const _ANSWER_HUNG_CONNUT_SEARCH_WOOD = """Du bois ? Il y a des palmiers partout. 

Pourquoi tu ne demandes pas à Ryland notre charpentier ?"""

const _ANSWER_HUNG_CONNUT_SEARCH_HOUBLON = """Du houblon ? Ce qu’on utilise pour faire de la bière. 

C’est malin maintenant j’ai envie d’une bière, la bière rousse de Eve est la meilleure."""

const _ANWSER_NO_WIND = """Oui, cela fait plusieurs jours que ça dure. 

Ce n’est pas la première fois que ca arrive. Je ne sais pas comment mais le Capitaine a réussi à faire revenir les vents la dernière fois que cela s'était produit. """
