extends PNJ

@onready var orco = $"../pnj-orco"

func _on_area_3d_body_entered(_body: Node3D) -> void:
	gui.open_dialog_next(Dialog.pnjSayLeft(self, _TEXT_1)
		.next(Dialog.pnjSay(orco, _TEXT_2)
			.next(Dialog.pnjSay(self, _TEXT_3)
				.next(Dialog.pnjSay(orco, _TEXT_4)
					.next(Dialog.pnjSay(self, _TEXT_5)
						.next(Dialog.pnjSay(orco, _TEXT_6)
							.on_close(func(): gui.doTransition(_goto_auberge))))))))

func _goto_auberge() -> void :
	pass

const _TEXT_1 = "Orco rend moi ma hache. Tu sais ce qu’est un orc sans sa hache."
const _TEXT_2 = "Non je peux pas t'as foutu le bordel hier soir à l’auberge."
const _TEXT_3 = "Aller Orco, entre orcs, s’il te plait. J’ai l’impression d’avoir perdu ma femme si j’en avais eu une."
const _TEXT_4 = "Non c’est non, Et puis qu’est ce que t’en ferai ? On ne part pas en guerre. Et maya m’a dit qu’elle refuserait de me servir le moindre alcool si je te rends ta hache."
const _TEXT_5 = "Je comprends, mais t’es plus mon ami. Je te boude."
const _TEXT_6 = "Ce n'est pas moi qui ai cassé une table de l’auberge a coup de hache hier soir. 
Mais je comprends ta douleur, va prendre une bière à mes frais je te rejoins ce soir."
