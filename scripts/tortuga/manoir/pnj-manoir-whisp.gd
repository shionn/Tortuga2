extends "res://scripts/pnj.gd"

func _ready() -> void:
	super._ready()
	_animation.play("sit")

func on_interact() -> void:
	gui.open_dialog(pnj_name,TEXT_INTRO).with_options([
		PnjDialogOption.new(
			func (): return tags.have(Tags.SEARCH_WIND) and not tags.have(Tags.WIND_BLOWING),
			Dialogs.question_missing_wind,
			_on_search_win
		), 
		PnjDialogOption.new(
			func (): return tags.have(Tags.SEARCH_PASS) and not bag.contain(Bag.PasseBarque) and not bag.contain(Bag.PasseBarqueTanpon),
			"""J’ai besoin d’un pass""",
			_on_search_pass
		)
	])
	$Laugh.play()

func on_item_drop(item : Item) -> void:
	if item.name == 'TresorBarbeDrue' :
		gui.open_dialog(pnj_name,TEXT_TRESOR_BARBE_DRUE)
	elif item.name == 'ParcheminBarbeDrue' :
		gui.open_dialog(pnj_name,TEXT_PARCHEMIN_BARBE_DRUE)
	elif item.name == Bag.PageHungConnutFrag1 or item.name == Bag.PageHungConnutFrag2 or item.name == Bag.PageHungConnutFrag3 :
		gui.open_dialog(pnj_name, TEXT_FRAGMENT_HUNG_CONNUT)
	elif item.name == Bag.BouteilleCapitain:
		gui.open_dialog(pnj_name, TEXT_ON_BOTTLE)
		bag.unloot(Bag.BouteilleCapitain)
		bag.loot(Bag.PasseBarque)
		tags.remove(Tags.SEARCH_CAPTAIN_BOTTLE)
		tags.remove(Tags.SEARCH_PASS)
	elif item.name == Bag.ListInvocationVent:
		gui.open_dialog(pnj_name, _TEXT_ASK_BONE)
	else :
		super.on_item_drop(item)

func _on_search_win() -> void :
	if not bag.contain(Bag.PasseBarque) and not bag.contain(Bag.PasseBarqueTanpon) :
		tags.add(Tags.SEARCH_BARQUE)
	gui.open_dialog(pnj_name, TEXT_WIND_MISSING)

func _on_search_pass() -> void:
	gui.open_dialog(pnj_name, TEXT_SEARCH_PASS)
	tags.add(Tags.SEARCH_CAPTAIN_BOTTLE)

	

const TEXT_INTRO = """Salut. Tortuga est méconnaissable ce matin. 

Il nous faut comprendre ce qu'il se passe, et peut être empécher que cela survienne à nouveau.
Généralement on apprend plein de choses dans la taverne, commence donc par la."""

const TEXT_TRESOR_BARBE_DRUE = """Ho je vois que tu as retrouvé le trésor de Barbe Drue. 

N'oublie pas que tous gains de pirate est soumis à une taxe de 25%. 
Il te faut déposer cette part de tes gains au coffre."""

const TEXT_PARCHEMIN_BARBE_DRUE = """Quel étrange parchemin, je n'y comprend rien. 

Il doit bien y avoir une érudite au village pour te le traduire."""

const TEXT_FRAGMENT_HUNG_CONNUT = """Ca ressemble à une carte mais c’est incomplet. 

Zakari le cartographe devrait pouvoir t’aider."""

const TEXT_WIND_MISSING = """Le vent ? Pourquoi du vent ? Après il va faire froid et j’aime bien quand il fait chaud moi. Mais si vous y tenez juste une petite brise pas plus. Enfin, à peine plus pour votre machin là mais moi je ne peux rien faire.

Je ne suis pas Chamane pardi. Par contre la Chamane Sexy, Elle, elle peut vous aider !

Oui je sais où elle est, évidemment, Ahhh, Je la connais bien... Euh ne me demandez pas pourquoi ! Elle vit recluse dans une petite cabane au milieu de la petite île au Sud-Est de Tortuga. Mais vous allez devoir y aller en bateau."""

const TEXT_SEARCH_PASS = """Hein ? Quoi ? Je ne dormais pas je méditais, c’est important de méditer ! Vous voulez quoi déjà ? Une barque ? Un pass ? 

Ah mais oui il va vous falloir un pass sinon Rurik ne vous laissera jamais monter à bord ! J’avais oublié, oui j’en ai un, euh où est il ? 

Bon hum, je l’ai encore égaré, la dernière fois que je l’ai vu il était dans ma poche. Et ma poche était sur moi. Et j’étais ici... Ici, ah j’ai perdu ma flasque de Whisky. 

Par le Kraken, je commence à me dessécher ! Allez houste je dois chercher ma flasque sans elle je sais plus où j'en suis et j’ai soif !"""

const TEXT_ON_BOTTLE = """Ici ? Ah mais oui la voilà! ma flasque enfin retrouvée ! Bon vous avez de la chance en fouillant dans mes frasques j’ai retrouvé le Pass ! Mais pour qu’il soit valide, faut le faire tamponner par Rurik. 

Voilà allez houste, j’ai besoin de repos… eeuuuuh non de calme je veux dire, de calme pour réfléchir voilà !"""

const _TEXT_ASK_BONE = """Quoi tu veux que je te donne un de mes os ? Non c’est impossible, j’en ai trop besoin, après je serais éparpillé et j’auraiiiiii... Hmmm, plus de mal à me rappeler des choses voilà!! Tu veux pas demander à quelqu’un d’autre ? Y a d'autres pirates qui ont subi la même malédiction que moi. Pas aussi sexy, je vous l’acccorde, mais il peuvent servir à quelque chose pour une fois!  

La plupart des pirates meurent en mer aussi y a très peu de cadavres sur l'île à moins que la mer ne les charrie. Allez fouiller les plages Houste ou alors il faudrait profaner une tombe, mais seul un fou ferai ça! Ça pue là dedans!"""
