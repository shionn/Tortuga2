extends Object
class_name Dialog

var text: String
var options: Array[DialogOption] = []
var pnj: PNJ
var _gui: Gui
var close: bool = true

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

## Les dialog par defaut

const question_search_forbid_fruit = "Je cherche le fruit défendu. Est-ce que tu en as déjà entendu parler ?"
const question_search_forbid_fruit_montagn = "Je veux escalader la montagne"
const question_search_forbid_fruit_teleport = "Je cherche un crystal de téléportation"
const question_hung_connut_search_charpentier = "L'escalator au nord est détruit"
const question_hung_connut_search_wood = "J'ai besoin de bois"
const question_hung_connut_search_houblon = "J'ai besoin de houblon"
const question_missing_wind = "Il n’y a plus de vent"

func option_search_forbid_fruit(player) -> Dialog :
	option_dialog("Fruit défendu ?", 
		playerSay(player,question_search_forbid_fruit).next(pnjSay(pnj, """Je n'en ai jamais entendu parler.""")),
		func(): return pnj.tags.have(Tags.FORBID_FRUIT_SEARCH) and not pnj.bag.contain(Bag.FruitDefendu) or true
	)
	return self
