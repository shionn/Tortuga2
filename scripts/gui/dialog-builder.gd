extends Object
class_name Dialog

var text: String
var options: Array[DialogOption] = []
var pnj: PNJ
var _gui: Gui
var close: bool = true
var on_open_action: Callable
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

func on_open(_action: Callable) -> Dialog :
	on_open_action = _action
	return self

func on_close(_action: Callable) -> Dialog :
	on_close_action = _action
	return self

func on_yes_no(on_no: Callable, on_yes: Callable) -> Dialog:
	return option_action("Non", on_no).option_action("Oui", on_yes).no_close()

func no_close() -> Dialog :
	close = false
	return self

## Les dialog par defaut

const SEARCH_FORBID_FRUIT : Array[String] = ["Fruit défendu ?", "Je cherche le fruit défendu. Est-ce que tu en as déjà entendu parler ?", """Je n'en ai jamais entendu parler."""]
static func SEARCH_FORBID_FRUIT_CONDITION(_pnj: PNJ) : return func(): return _pnj.tags.have(Tags.FORBID_FRUIT_SEARCH) and not _pnj.tags.have(Tags.FORBID_FRUIT_LOOTED)

const SEARCH_FORBID_FRUIT_MOUNTAIN : Array[String] = ["Escalader la montagne ?", "Je veux escalader la plus grande montagne de l'île. Sais tu comment faire ?", """Je ne sais pas comment faire."""]
static func SEARCH_FORBID_FRUIT_MOUNTAIN_CONDITION(_pnj) : return func(): return _pnj.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE) and not _pnj.bag.contain(Bag.CrystalTeleportationOasis)

const SEARCH_TELEPORT_CRYSTAL : Array[String] = ["Crystal de téléportation ?", "Je cherche un crystal de téléportation.", """Mais de quoi tu parles ?"""]
static func SEARCH_TELEPORT_CRYSTAL_CONDITION(_pnj) : return func() : return _pnj.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) and not _pnj.bag.contain(Bag.CrystalTeleportationOasis)

const SEARCH_CHARPENTIER : Array[String] = ["L'escalator détruit ?","L'escalator au nord est détruit. Sais-tu comment faire pour le réparer ?", "Quoi l'escalator est détruit ? C'est une catastrophe ! Comment on va faire sans champignon ?"]
static func SEARCH_CHARPENTIER_CONDITION(_pnj) : return func() : return _pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR) and _pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)

const SEARCH_WOOD : Array[String] = ["Du bois ?", "J'ai besoin de bois. Sais-tu ou en trouver ?", _ANSWER_HUNG_CONNUT_SEARCH_WOOD]
static func SEARCH_WOOD_CONDITION(_pnj:PNJ) : return func(): return _pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_WOOD) and not _pnj.bag.contain(Bag.BoisDeQualite)

const SEARCH_HOUBLON : Array[String] = ["Du houblon ?", "J'ai besoin de houblon. Sais-tu ou en trouver ?", """Du houblon ? Ce qu’on utilise pour faire de la bière. 
C’est malin maintenant j’ai envie d’une bière, la bière rousse de Eve est la meilleure."""]
static func SEARCH_HOUBLON_CONDITION(_pnj:PNJ) : return func(): return _pnj.tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) and not _pnj.bag.contain(Bag.Houblon)

const NO_WIND : Array[String] = ["Absence du vent ?", "Il n’y a plus de vent.", """Oui, cela fait plusieurs jours que ça dure. 
Ce n’est pas la première fois que ca arrive. Je ne sais pas comment mais le Capitaine a réussi à faire revenir les vents la dernière fois que cela s'était produit."""]
static func NO_WIND_CONDITION(_pnj:PNJ) : return func(): return _pnj.tags.have(Tags.SEARCH_WIND) and not _pnj.tags.have(Tags.WIND_BLOWING)

const SEARCH_CARTOGRAPH: Array[String] = ["Cartographe ?", "Pour explorer les îles alentour, je cherche un cartographe. Est-ce que cela t'intéresse ?",
"Un cartographe ? ", "Le seul cartographe que je connaisse c’est Zakari. Tu le trouveras probablement dans le dortoir. Collé à sa lunette."]
static func SEARCH_CARTOGRAPH_CONDITION(_pnj:PNJ) : return func(): return _pnj.tags.have(Tags.SEARCH_CARTOGRAPH) and not _pnj.tags.have(Tags.FOUND_CARTOGRAPH)

func option_search_forbid_fruit()                  -> Dialog : return _option_default(SEARCH_FORBID_FRUIT_CONDITION(pnj),          SEARCH_FORBID_FRUIT)
func option_search_forbid_fruit_montain()          -> Dialog : return _option_default(SEARCH_FORBID_FRUIT_MOUNTAIN_CONDITION(pnj), SEARCH_FORBID_FRUIT_MOUNTAIN)
func option_search_forbid_fruit_montain_teleport() -> Dialog : return _option_default(SEARCH_TELEPORT_CRYSTAL_CONDITION(pnj),      SEARCH_TELEPORT_CRYSTAL)
func option_hung_connut_search_charpentier()       -> Dialog : return _option_default(SEARCH_CHARPENTIER_CONDITION(pnj),           SEARCH_CHARPENTIER)
func option_hung_connut_search_wood()              -> Dialog : return _option_default(SEARCH_WOOD_CONDITION(pnj),                  SEARCH_WOOD)
func option_hung_connut_search_houblon()           -> Dialog : return _option_default(SEARCH_HOUBLON_CONDITION(pnj),               SEARCH_HOUBLON)
func option_search_wind()                          -> Dialog : return _option_default(NO_WIND_CONDITION(pnj),                      NO_WIND)
func option_search_cartograph()                    -> Dialog : return _option_default(SEARCH_CARTOGRAPH_CONDITION(pnj),            SEARCH_CARTOGRAPH)



func _option_default(condition : Callable, data: Array[String]) -> Dialog:
	return option_dialog(data[0], 
		playerSay(pnj.player,  data[1]).next(pnjSay(pnj, data[2])),
		condition
	)



const _ANSWER_HUNG_CONNUT_SEARCH_WOOD = """Du bois ? Il y a des palmiers partout. 

Pourquoi tu ne demandes pas à Ryland notre charpentier ?"""

const _ANSWER_HUNG_CONNUT_SEARCH_HOUBLON = """Du houblon ? Ce qu’on utilise pour faire de la bière. 

C’est malin maintenant j’ai envie d’une bière, la bière rousse de Eve est la meilleure."""
