extends PNJ

@onready var kazrog = $"../pnj-kazrog" as PNJ

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, "Que faire ?")
		.option_dialog("Les écouter", 
			Dialog.pnjSay(self, _TEXT_1)
				.next(Dialog.pnjSayLeft(kazrog, _TEXT_2)
				.next(Dialog.pnjSay(self, _TEXT_3)
				.next(Dialog.pnjSayLeft(kazrog, _TEXT_4)
				.next(Dialog.pnjSay(self, _TEXT_5)
				.next(Dialog.pnjSayLeft(kazrog, _TEXT_6)
				.next(Dialog.playerSay(player, _TEXT_7)))))))
		)
		.option_dialog(_TEXT_20,
			Dialog.playerSay(player, _TEXT_21)
				.next(Dialog.pnjSay(self, _TEXT_22)
					.on_close(_return_to_armurerie)),
		func() : return bag.contain(Bag.HacheKazrog))
	)

func _return_to_armurerie() -> void:
	gui.doTransition(func():tags.remove(Tags.ORCO_AT_AUBERGE))


func on_tag_change() -> void:
	visible = tags.have(Tags.ORCO_AT_AUBERGE)
	if visible: position.y = 2.25
	else : position.y = -10
	
const _TEXT_1 = "Arrête de boire c'est pas sérieux."
const _TEXT_2 = "Je bois si je veux. Rends moi ma hache."
const _TEXT_3 = "Je ne peux pas. C'est maya qui a confisqué ta hache. 
Ce n'est pas digne d'un Orc de noyer son chagrin dans l'alcool, tu ressembles à un humain."
const _TEXT_4 = "Ce n'est pas digne d'un Orc de prendre la hache d'un autre Orc."
const _TEXT_5 = "Mais je t'ai déjà dit que c'était Maya qui m'as confié ta hache comme punition pour la casse que tu as causé ici hier soir."
const _TEXT_6 = "Je ne m'en souviens pas. Rends moi ma hache."
const _TEXT_7 = "C'est un dialogue de sourd..."

const _TEXT_20 = "L'armurerie sans protection ?"
const _TEXT_21 = "Orco t’es partit de l’armurerie sans fermer derrière toi. Avec toutes ces armes et la poudre à canon, c’est dangereux."
const _TEXT_22 = "Mais tu as raison, vite j’y retourne essaie de calmer Kazrog."
