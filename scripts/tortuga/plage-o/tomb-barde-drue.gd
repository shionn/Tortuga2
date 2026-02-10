extends "res://scripts/interactable.gd"

@onready var _barbe_drue = $"../BarbeDrue" as PNJ

func on_interact() -> void:
	if bag.contain(Bag.ListInvocationVent) and not bag.contain(Bag.Ossement):
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_PREVENT_PROFANATION)
			.option_action("Chercher un autre moyen", func() : player.play_anim_no())
			.option_action("Profaner la tombe tant pis pour les conséquences", _open_tomb)
			.no_close()
		)
	else :
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_1)
			.next(Dialog.playerSay(player,_TEXT_2)
				.next(Dialog.playerSay(player,_TEXT_3))))
		
func _open_tomb() -> void :
	bag.unloot(Bag.TresorBarbeDrue)
	bag.unloot(Bag.TresorBarbeDrueNet)
	bag.loot(Bag.OssementBarbeDrue)
	bag.loot(Bag.TresorBarbeDrueMaudit)
	tags.add(Tags.TOMB_BARBE_DRUE_OPENED)
	gui.open_dialog_next(Dialog.pnjSay(_barbe_drue, _TEXT_PROFANATION))
	
const _TEXT_PROFANATION = """Maudit sois tu Pirate ! Tu oses profaner ma tombe et prendre un de mes ossements ? En guise de punition je reprends mon trésor ! 

Profites bien de cet ossement et des quelques piécettes que je te laisse."""

const _TEXT_PREVENT_PROFANATION = """Je pourrai profané la tombe et prendre un ossement pour le rituel. Mais une tombe est sacrée. 

Que faire ?"""

const _TEXT_1 = """Sur la tombe il est écrit : 
	[i]Ci-gît BarbeDrue.
	Toi qui convoite mon trésor,
	Derrière le rocher
	Tu devra chercher[/i]"""

const _TEXT_2 ="""[i]	Mais attention pour l'obtenir
	Toute ton attention tu devra fournir
	Le clé tu devras trouver
	En revenant sur tes pas[/i]"""

const _TEXT_3 =  """[i]	Les morceaux ensemble recollés
	La clé tu obtiendras
	1[/i]"""
