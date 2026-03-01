extends "res://scripts/pnj.gd"

@onready var _cocktail = $"../cocktail" as Node3D

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
		.option_search_forbid_fruit()
		.option_search_forbid_fruit_montain()
		.option_search_forbid_fruit_montain_teleport()
		.option_hung_connut_search_charpentier()
		.option_hung_connut_search_wood()
		.option_dialog(Dialog.SEARCH_HOUBLON[0], 
			Dialog.playerSay(player, Dialog.SEARCH_HOUBLON[1])
				.next(Dialog.pnjSay(self, _SEARCH_HOUBLON)),
			func (): return tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) and not bag.contain(Bag.Houblon))
		.option_search_wind()
		.option_search_cartograph()
		.option_dialog(Dialog.SEARCH_BOOK[0], 
			Dialog.playerSay(player, Dialog.SEARCH_BOOK[1])
				.next(Dialog.pnjSay(self, _TEXT_BOOK_1)
					.option_dialog("Frapper Kerim avec le Livre", 
						Dialog.playerSay(player, _TEXT_BOOK_2)
							.next(Dialog.pnjSay(self, _TEXT_BOOK_3)
								.on_close(func(): tags.add(Tags.KNOW_MAYA_THROW_BOOK_TRANSFOPAPER))),
						func(): return tags.have(Tags.KNOW_MAYA_BOOK_TRANSFOPAPER))),
			Dialog.SEARCH_BOOK_CONDITION(self))
	)

func on_item_drop(item : Item) -> void:
	if item.isGold() :
		gui.open_dialog_next(Dialog.pnjSay(self, """Qu’est ce que je vous sers ? """)
			.option_action("""Bière rousse de Eve""", func(): bag.loot(Bag.BiereRousseDeEve), func(): return not bag.contain(Bag.BiereRousseDeEve))
			.option_dialog("""Omelette aux champignons""", Dialog.pnjSay(self, _TEXT_ON_OMELETTE).on_close(func(): tags.add(Tags.KNOW_FERMIER_LOVE_OMELETTE)))
			.option_action("Un cocktail", _on_ask_cocktail)
		)
	else : 
		super.on_item_drop(item)

var _ingredient = ""
var _last_ingredient = ""

func _add_ingredient(i:String, next : Callable): 
	play_anim_yes()
	_ingredient = _ingredient + i
	_last_ingredient = i
	next.call()

func _on_ask_cocktail() -> void:
	_ingredient = ""
	_last_ingredient = ""
	_on_ask_cocktail_alcool()

func _on_ask_cocktail_alcool() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, "Quel alcool je mets ?")
		.option_action("Rhum", func(): _add_ingredient("Rhum", _on_ask_cocktail_alcool))
		.option_action("Gin", func(): _add_ingredient("Gin", _on_ask_cocktail_alcool))
		.option_action("Vodka", func(): _add_ingredient("Vodka", _on_ask_cocktail_alcool))
		.option_action("Téquila", func(): _add_ingredient("Téquila", _on_ask_cocktail_alcool))
		.option_action("Assez d'alcool", _on_ask_cocktail_liqueur)
		.no_close()
	)

func _on_ask_cocktail_liqueur() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, "Est-ce que j'ajoute une Liqueur ?")
		.option_action("Crême de Café", func(): _add_ingredient("Café", _on_ask_cocktail_liqueur))
		.option_action("Crême de Franboise", func(): _add_ingredient("Franboise", _on_ask_cocktail_liqueur))
		.option_action("Cointreau", func(): _add_ingredient("Cointreau", _on_ask_cocktail_liqueur))
		.option_action("Crême de Whisky", func(): _add_ingredient("Whisky", _on_ask_cocktail_liqueur))
		.option_action("Assez de liqueur", _on_ask_cocktail_soft)
		.no_close()
	)

func _on_ask_cocktail_soft() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, "Est-ce que j'ajoute un Soft ?")
		.option_action("Jus d'Ananas", func(): _add_ingredient("Ananas", _on_ask_cocktail_soft))
		.option_action("Jus de Coco", func(): _add_ingredient("Coco", _on_ask_cocktail_soft))
		.option_action("Jus de Canneberg", func(): _add_ingredient("Canneberg", _on_ask_cocktail_soft))
		.option_action("Eau de Seltz", func(): _add_ingredient("Seltz", _on_ask_cocktail_soft))
		.option_action("Assez de Soft", _on_ask_cocktail_other)
		.no_close()
	)

func _on_ask_cocktail_other() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, "Est-ce que j'ajoute autre chose ?")
		.option_action("Du Citron", func(): _add_ingredient("Citron", _on_ask_cocktail_other))
		.option_action("De la Menthe", func(): _add_ingredient("Menthe", _on_ask_cocktail_other))
		.option_action("Une rondelle Orange", func(): _add_ingredient("Orange", _on_ask_cocktail_other))
		.option_action("Sirop de Sucre", func(): _add_ingredient("Sirop", _on_ask_cocktail_other))
		.option_action("C'est assez", _on_ask_cocktail_glacon)
		.no_close()
	)

func _on_ask_cocktail_glacon() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, "Est-ce que je met des glaçon ?")
		.on_yes_no(_on_ask_cocktail_no_glacon, _on_ask_cocktail_yes_glacon)
	)

# Rhum+ Gin+ Vodka+ Téquila+
# Café+ Franboise Cointreau+ Whisky+
# Ananas+ Coco+ Seltz+ Canneberg+
# Citron+ Menthe+ Orange Sirop+

func _on_ask_cocktail_no_glacon() -> void : 
	player.play_anim_no()
	if _isCocktail(["Rhum", "Seltz", "Sirop", "Citron", "Menthe"]) :
		_serv_cocktail("un mojito sans glaçon!", Bag.MojitoSansGlace) 
	elif  _isCocktail(["Rhum", "Coco", "Ananas"]) : 
		_serv_cocktail("une Pinacolada sans Glaçon!", "") 
	elif  _isCocktail(["Vodka", "Cointreau", "Canneberg", "Citron"]) : 
		_serv_cocktail("Un Cosmopolitan!", "") 
	elif  _isCocktail(["Gin", "Seltz", "Citron"]) : 
		_serv_cocktail("un Gin Tonic sans glaçon!", "") 
	elif  _isCocktail(["Cointreau", "Whisky", "Café"]) : 
		_serv_cocktail("un B52!", "") 
	elif  _isCocktail(["Rhum", "Citron", "Sirop"]) : 
		_serv_cocktail("un Daïquiri!", "") 
	elif  _isCocktail(["Téquila", "Cointreau", "Citron"]) : 
		_serv_cocktail("une Margarita sans glaçon!", "") 
	elif  _isCocktail(["Téquila", "Ananas", "Citron"]) : 
		_serv_cocktail("un Matador!", "") 
	elif  _isCocktail(["Gin", "Citron", "Sirop", "Menthe"]) : 
		_serv_cocktail("un Southside!", "") 
	else :
		_serv_cocktail("un truc innommable sans glaçon!", "") 
		play_anim_no()

func _on_ask_cocktail_yes_glacon() -> void : 
	player.play_anim_yes()
	if _isCocktail(["Rhum", "Seltz", "Sirop", "Citron", "Menthe"]) :
		_serv_cocktail("un mojito!", Bag.Mojito) 
	elif  _isCocktail(["Rhum", "JusCoco", "JusAnanas"]) : 
		_serv_cocktail("une Pinacolada!", "") 
	elif  _isCocktail(["Vodka", "Cointreau", "Canneberg", "Citron"]) : 
		_serv_cocktail("un Cosmopolitan avec glaçon!", "") 
	elif  _isCocktail(["Gin", "Seltz", "Citron"]) : 
		_serv_cocktail("un Gin Tonic!", "") 
	elif  _isCocktail(["Cointreau", "Whisky", "Café"]) : 
		_serv_cocktail("un B52 sans Flamme!", "") 
	elif  _isCocktail(["Rhum", "Citron", "Sirop"]) : 
		_serv_cocktail("un Daïquiri avec glaçon!", "") 
	elif  _isCocktail(["Téquila", "Cointreau", "Citron"]) : 
		_serv_cocktail("une Margarita!", "") 
	elif  _isCocktail(["Téquila", "Ananas", "Citron"]) : 
		_serv_cocktail("un Matador avec glaçon!", "") 
	elif  _isCocktail(["Gin", "Citron", "Sirop", "Menthe"]) : 
		_serv_cocktail("un Southside avec glaçon!", "") 
	else :
		_serv_cocktail("un truc innommable avec glaçon!", "") 
		play_anim_no()

func _isCocktail(expected : Array[String]) -> bool:
	var found = true
	var reste = _ingredient
	for e in expected:
		found = found && reste.contains(e)
		if (found) :
			reste = reste.replace(e,"")
	return found and reste == ""


func _serv_cocktail(_name: String, item: String) -> void :
	play_anim_yes()
	gui.open_dialog_next(Dialog.pnjSay(self,"Voila "+_name)
		.on_close(func(): _cocktail.visible = true)
	)
	_cocktail.item = item

const _TEXT = """Bonjour aventurier.ère. 
	
Prenez place et commandez donc un verre auprès d’une de nos serveuses."""

const _SEARCH_HOUBLON =  """Ici on en vend que sous forme liquide. 

La bière rousse de Eve est la meilleure, tout le monde en raffole, surtout Rurik."""

const _TEXT_ON_OMELETTE = """Les omelettes aux champignons sont une de nos spécialités, malheureusement nous manquons de champignons en ce moment. 

D’ailleurs Nino, le fermier, en raffole, je ne sais pas comment il va le prendre quand il le saura le pauvre. """

const _TEXT_BOOK_1 = """Hier soir ? Kerim ? Un livre ? 
[Rougie]
Oui Kerim est venu hier soir, mais il n'a plus le droit de revenir ici. 
Mais je ne me souviens pas d’un livre."""

const _TEXT_BOOK_2 = "Il paraît que tu l'as mis dehors hier soir en le frappant avec son livre. Est-ce que tu t’en souviens ? "

const _TEXT_BOOK_3 = """Haa, oui ça me revient. Hier soir Kerim m'a foutu la honte de ma vie. Je lui ai ordonné de ne plus jamais revenir.
[Rougie]
J'étais furieuse j’ai pris le premier truc que j’ai trouvé, c’était peut être bien son livre, et je lui ai tapé dessus avec jusqu’à ce qu’il parte. Quand il était enfin dehors, je lui ai jeté le livre dessus."""
