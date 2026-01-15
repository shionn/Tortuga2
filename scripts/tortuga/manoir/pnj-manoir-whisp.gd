extends "res://scripts/pnj.gd"

func _ready() -> void:
	super._ready()
	_animation.play("sit")

func on_interact() -> void:
	gui.open_dialog(pnj_name,TEXT_INTRO)
	$Laugh.play()

func on_item_drop(item : Item) -> void:
	if item.name == 'TresorBarbeDrue' :
		gui.open_dialog(pnj_name,TEXT_TRESOR_BARBE_DRUE)
	elif item.name == 'ParcheminBarbeDrue' :
		gui.open_dialog(pnj_name,TEXT_PARCHEMIN_BARBE_DRUE)
	elif item.name == Bag.PageHungConnutFrag1 or item.name == Bag.PageHungConnutFrag2 or item.name == Bag.PageHungConnutFrag3 :
		gui.open_dialog(pnj_name, TEXT_FRAGMENT_HUNG_CONNUT)
	else :
		super.on_item_drop(item)


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

#const TEXT_
