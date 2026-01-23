extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if bag.contain(Bag.ListInvocationVent) and not bag.contain(Bag.Ossement):
		gui.open_dialog("Ci-gît BarbeDrue",_TEXT_PREVENT_PROFANATION).with_options([
			PnjDialogOption.new(
				func() : return true,
				"Chercher un autre moyen",
				func() : player.play_anim_no()
			),
			PnjDialogOption.new(
				func() : return true,
				"Profaner la tombe tant pis pour les conséquences",
				_open_tomb
			)
		])
	else :
		gui.open_dialog("Ci-gît BarbeDrue",_TEXT)
		
func _open_tomb() -> void :
	bag.unloot(Bag.TresorBarbeDrue)
	bag.unloot(Bag.TresorBarbeDrueNet)
	bag.loot(Bag.Ossement)
	bag.loot(Bag.TresorBarbeDrueMaudit)
	tags.add(Tags.TOMB_BARBE_DRUE_OPENED)
	gui.open_dialog("Barbe Drue", _TEXT_PROFANATION)
	
const _TEXT_PROFANATION = """Maudit sois tu Pirate ! Tu oses profaner ma tombe et prendre un de mes ossements ? En guise de punition je reprends mon trésor ! 

Profites bien de mon ossement et des quelques piécettes que je te laisse."""

const _TEXT_PREVENT_PROFANATION = """Je pourrai profané la tombe et prendre un ossement pour le rituel. Mais une tombe est sacrée. 

Que faire ?"""

const _TEXT =  """Toi qui convoite mon trésor,
Derrière le rocher
Tu devra chercher
Mais attention pour l'obtenir
Toute ton attention tu devra fournir
Le clé tu devras trouver
En revenant sur tes pas
Les morceaux ensemble recollés
La clé tu obtiendras

1"""
