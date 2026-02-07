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
	)

func on_item_drop(item : Item) -> void:
	if item.isGold() :
		gui.open_dialog(pnj_name, """Qu’est ce que je vous sert ? """).with_options([
			PnjDialogOption.new(
				func(): return true, 
				"""Bière rousse de Eve""",
				func(): bag.loot(Bag.BiereRousseDeEve)
			),
			PnjDialogOption.new(
				func(): return true, 
				"""Omelette aux champignons""",
				_on_ask_omelette
			),
			PnjDialogOption.new(
				func(): return true,
				"Je voudrais un cocktail",
				_on_ask_cocktail
			)
		])
	else : 
		super.on_item_drop(item)

func _on_ask_omelette() -> void :
	tags.add(Tags.KNOW_FERMIER_LOVE_OMELETTE)
	gui.open_dialog(pnj_name, _TEXT_ON_OMELETTE)

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
	gui.open_dialog(pnj_name,"Ajouter un alcool ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Du Rhum",
			func(): _add_ingredient("Rhum",_on_ask_cocktail_alcool)
		), PnjDialogOption.new(
			func(): return true,
			"Du Gin",
			func(): _add_ingredient("Gin",_on_ask_cocktail_alcool)
		), PnjDialogOption.new(
			func(): return true,
			"De la Vodka",
			func(): _add_ingredient("Vodka",_on_ask_cocktail_alcool)
		), PnjDialogOption.new(
			func(): return true,
			"De la Téquila",
			func(): _add_ingredient("Téquila",_on_ask_cocktail_alcool)
		), PnjDialogOption.new(
			func(): return true,
			"Assez d'alcool.",
			_on_ask_cocktail_liqueur
		)
	])

func _on_ask_cocktail_liqueur() -> void:
	gui.open_dialog(pnj_name,"Ajouter une Liqueur ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Crême de Café",
			func(): _add_ingredient("Café",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"Crême de Franboise",
			func(): _add_ingredient("Franboise",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"Cointreau",
			func(): _add_ingredient("Cointreau",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"Crême de Whisky",
			func(): _add_ingredient("Whisky",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"Assez de liqueur",
			_on_ask_cocktail_soft
		)
	])

func _on_ask_cocktail_soft() -> void:
	gui.open_dialog(pnj_name,"Ajouter un Soft ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Jus d'Ananas",
			func(): _add_ingredient("Ananas",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Jus de Coco",
			func(): _add_ingredient("Coco",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Jus de Canneberg",
			func(): _add_ingredient("Canneberg",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Eau de Seltz",
			func(): _add_ingredient("Seltz",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Assez de Soft",
			_on_ask_cocktail_other
		)
	])

func _on_ask_cocktail_other() -> void:
	gui.open_dialog(pnj_name,"Autre chose ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Du Citron",
			func(): _add_ingredient("Citron",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"De la Menthe",
			func(): _add_ingredient("Menthe",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"Une rondelle Orange",
			func(): _add_ingredient("Orange",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"Sirop de Sucre",
			func(): _add_ingredient("Sirop",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"C'est assez",
			_on_ask_cocktail_glacon
		)
	])

func _on_ask_cocktail_glacon() -> void:
	gui.open_yes_no_question(pnj_name, "Avec des Glacon ?", _on_ask_cocktail_no_glacon, _on_ask_cocktail_yes_glacon)

# Rhum+ Gin+ Vodka+ Téquila+
# Café+ Franboise Cointreau+ Whisky+
# Ananas+ Coco+ Seltz+ Canneberg+
# Citron+ Menthe+ Orange Sirop+

func _on_ask_cocktail_no_glacon() -> void : 
	if _isCocktail(["Rhum", "Seltz", "Sirop", "Citron", "Menthe"]) :
		_serv_cocktail("Un mojito sans glaçon!", Bag.MojitoSansGlace) 
	elif  _isCocktail(["Rhum", "Coco", "Ananas"]) : 
		_serv_cocktail("Une Pinacolada sans Glaçon!", "") 
	elif  _isCocktail(["Vodka", "Cointreau", "Canneberg", "Citron"]) : 
		_serv_cocktail("Un Cosmopolitan!", "") 
	elif  _isCocktail(["Gin", "Seltz", "Citron"]) : 
		_serv_cocktail("Un Gin Tonic sans glaçon!", "") 
	elif  _isCocktail(["Cointreau", "Whisky", "Café"]) : 
		_serv_cocktail("Un B52!", "") 
	elif  _isCocktail(["Rhum", "Citron", "Sirop"]) : 
		_serv_cocktail("Un Daïquiri!", "") 
	elif  _isCocktail(["Téquila", "Cointreau", "Citron"]) : 
		_serv_cocktail("Une Margarita sans glaçon!", "") 
	elif  _isCocktail(["Téquila", "Ananas", "Citron"]) : 
		_serv_cocktail("Un Matador!", "") 
	elif  _isCocktail(["Gin", "Citron", "Sirop", "Menthe"]) : 
		_serv_cocktail("Un Southside!", "") 
	else :
		_serv_cocktail("Un truc innommable sans glaçon!", "") 
		play_anim_no()

func _on_ask_cocktail_yes_glacon() -> void : 
	if _isCocktail(["Rhum", "Seltz", "Sirop", "Citron", "Menthe"]) :
		_serv_cocktail("Un mojito!", Bag.Mojito) 
	elif  _isCocktail(["Rhum", "JusCoco", "JusAnanas"]) : 
		_serv_cocktail("Une Pinacolada!", "") 
	elif  _isCocktail(["Vodka", "Cointreau", "Canneberg", "Citron"]) : 
		_serv_cocktail("Un Cosmopolitan avec glaçon!", "") 
	elif  _isCocktail(["Gin", "Seltz", "Citron"]) : 
		_serv_cocktail("Un Gin Tonic!", "") 
	elif  _isCocktail(["Cointreau", "Whisky", "Café"]) : 
		_serv_cocktail("Un B52 sans Flamme!", "") 
	elif  _isCocktail(["Rhum", "Citron", "Sirop"]) : 
		_serv_cocktail("Un Daïquiri avec glaçon!", "") 
	elif  _isCocktail(["Téquila", "Cointreau", "Citron"]) : 
		_serv_cocktail("Une Margarita!", "") 
	elif  _isCocktail(["Téquila", "Ananas", "Citron"]) : 
		_serv_cocktail("Un Matador avec glaçon!", "") 
	elif  _isCocktail(["Gin", "Citron", "Sirop", "Menthe"]) : 
		_serv_cocktail("Un Southside avec glaçon!", "") 
	else :
		_serv_cocktail("Un truc innommable avec glaçon!", "") 
		play_anim_no()

func _isCocktail(expected : Array[String]) -> bool:
	var found = true
	var reste = _ingredient
	for e in expected:
		found = found && reste.contains(e)
		if (found) :
			reste = reste.replace(e,"")
	return found and reste == ""


func _serv_cocktail(name: String, item: String) -> void :
		play_anim_yes()
		gui.open_dialog(pnj_name, name)
		_cocktail.item = item
		_cocktail.visible = true
	

const _TEXT = """Bonjour aventurier.ère. 
	
Prenez place et commandez donc un verre auprès d’une de nos serveuses."""

const _SEARCH_HOUBLON =  """Ici on en vend que sous forme liquide. 

La bière rousse de Eve est la meilleure, tout le monde en raffole, surtout Rurik."""

const _TEXT_ON_OMELETTE = """Les omelettes aux champignons sont une de nos spécialités, malheureusement nous manquons de champignons en ce moment. 

D’ailleurs Nino, le fermier, en raffole, je ne sais pas comment il va le prendre quand il le saura le pauvre. """
