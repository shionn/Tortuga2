extends "res://scripts/pnj.gd"

func _ready() -> void:
	super._ready()
	_animation.play("sit")

func on_interact() -> void:
	open_text(pnj_name,TEXT_INTRO)
	$Laugh.play()

func on_item_drop(item : Item) -> void:
	if item.name == 'TresorBarbeDrue' :
		open_text(pnj_name,TEXT_TRESOR_BARBE_DRUE)
	elif item.name == 'ParcheminBarbeDrue' :
		open_text(pnj_name,TEXT_PARCHEMIN_BARBE_DRUE)
	else :
		super.on_item_drop(item)


const TEXT_INTRO = """Salut. Tortuga est méconnaissable ce matin. 

Il nous faut comprendre ce qu'il se passe, pour y faire face, et peut être empécher que cela survienne à nouveau.
Généralement on apprend plein de chose dans la taverne, commence donc par la.

TODO a revoir"""

const TEXT_TRESOR_BARBE_DRUE = """Ho je vois que tu as retrouvé le trésor de Barbe Drue. 

N'oublie pas que tous gains de pirate est soumis à une taxe de 25%. 
Il te faut déposer cette part de tes gain au coffre.

TODO a revoir"""

const TEXT_PARCHEMIN_BARBE_DRUE = """Quel étrange parchemin, je n'y comprend rien. 

Il doit bien y avoir un herudie au village pour te le traduire.

TODO a revoir"""
