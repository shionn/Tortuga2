extends "res://scripts/pnj.gd"

@onready var _cocktail = $"../cocktail" as Node3D

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self), 
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		Dialogs.default_hung_connut_search_wood(self), 
		PnjDialogOption.new(
			func(): return tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON),
			Dialogs.question_hung_connut_search_houblon,
			func(): gui.open_dialog(pnj_name, _SEARCH_HOUBLON)
		),
		Dialogs.default_search_wind(self)
	])

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
			"De Café",
			func(): _add_ingredient("Café",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"De Cassis",
			func(): _add_ingredient("Cassis",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"Du Cointreau",
			func(): _add_ingredient("Cointreau",_on_ask_cocktail_liqueur)
		), PnjDialogOption.new(
			func(): return true,
			"Assez de liqueur",
			_on_ask_cocktail_fruit
		)
	])


func _on_ask_cocktail_fruit() -> void:
	gui.open_dialog(pnj_name,"Ajouter un fruit ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Du Citron",
			func(): _add_ingredient("Citron",_on_ask_cocktail_fruit)
		), PnjDialogOption.new(
			func(): return true,
			"Une Cerise",
			func(): _add_ingredient("Cerise",_on_ask_cocktail_fruit)
		), PnjDialogOption.new(
			func(): return true,
			"Une rondelle Orange",
			func(): _add_ingredient("Orange",_on_ask_cocktail_fruit)
		), PnjDialogOption.new(
			func(): return true,
			"Du Melon",
			func(): _add_ingredient("Melon",_on_ask_cocktail_fruit)
		), PnjDialogOption.new(
			func(): return true,
			"Assez de Fruit",
			_on_ask_cocktail_plante
		)
	])

func _on_ask_cocktail_plante() -> void:
	gui.open_dialog(pnj_name,"Ajouter une plante ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"De la Menthe",
			func(): _add_ingredient("Menthe",_on_ask_cocktail_plante)
		), PnjDialogOption.new(
			func(): return true,
			"De la Tomate",
			func(): _add_ingredient("Tomate",_on_ask_cocktail_plante)
		), PnjDialogOption.new(
			func(): return true,
			"Assez de plante",
			_on_ask_cocktail_soft
		)
	])

func _on_ask_cocktail_soft() -> void:
	gui.open_dialog(pnj_name,"Ajouter un Soft ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Jus de Pomme",
			func(): _add_ingredient("Pomme",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Jus de Canneberge",
			func(): _add_ingredient("Canneberge",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Eau Gazeuse",
			func(): _add_ingredient("Gazeuse",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Sirop de Sucre",
			func(): _add_ingredient("Sirop",_on_ask_cocktail_soft)
		), PnjDialogOption.new(
			func(): return true,
			"Assez de Soft",
			_on_ask_cocktail_other
		)
	])

func _on_ask_cocktail_other() -> void:
	gui.open_dialog(pnj_name,"Autre Chose ?").with_options([
		PnjDialogOption.new(
			func(): return true,
			"Du Sucre",
			func(): _add_ingredient("Sucre",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"Du Sel",
			func(): _add_ingredient("Sel",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"Du Poivre",
			func(): _add_ingredient("Poivre",_on_ask_cocktail_other)
		), PnjDialogOption.new(
			func(): return true,
			"C'est assez",
			_on_ask_cocktail_glacon
		)
	])
	
func _on_ask_cocktail_glacon() -> void:
	gui.open_yes_no_question(pnj_name, "Avec des Glacon ?", _on_ask_cocktail_no_glacon, _on_ask_cocktail_yes_glacon)

func _on_ask_cocktail_no_glacon() -> void : 
	if _ingredient == "RhumCitronMentheGazeuseSucre" :
		_serv_cocktail("Un mojito sans glaçon!", Bag.MojitoSansGlace) 
	elif  _ingredient == "RhumCitronSirop" : 
		_serv_cocktail("Un Daïquiri!", "") 
	elif _ingredient == "VodkaCointreauCannebergeCitron" : 
		_serv_cocktail("Un Cosmopolitan!", "") 
	elif _ingredient == "GinCitronGazeuse" : 
		_serv_cocktail("Un Gin Tonic sans glaçon!", "") 
	else :
		_serv_cocktail("Un truc innommable sans glaçon!", "") 
		play_anim_no()

func _on_ask_cocktail_yes_glacon() -> void : 
	if _ingredient == "RhumCitronMentheGazeuseSucre" :
		_serv_cocktail("Un mojito!", Bag.Mojito) 
	elif  _ingredient == "RhumCitronSirop" : 
		_serv_cocktail("Un Daïquiri avec glaçon!", "") 
	elif _ingredient == "VodkaCointreauCannebergeCitron" : 
		_serv_cocktail("Un Cosmopolitan avec glaçon!", "") 
	elif _ingredient == "GinCitronGazeuse" : 
		_serv_cocktail("Un Gin Tonic!", "") 
	else :
		_serv_cocktail("Un truc innommable avec glaçon!", "") 
		play_anim_no()
		
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
