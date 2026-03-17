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
	)

func on_tag_change() -> void:
	visible = tags.have(Tags.ORCO_AT_AUBERGE)
	if visible: position.y = 2.25
	else : position.y = -10
	
const _TEXT_1 = "Arrête de boire c'est pas serieux."
const _TEXT_2 = "Je bois si je veux. 
Rend moi ma hache."
const _TEXT_3 = "Je peu pas. C'est maya qui a confiqué ta hache. 
Ce n'est pas digne d'un Orc de noyer son chagrin dans l'alcool, tu ressembles à un humain."
const _TEXT_4 = "Ce n'est pas digne d'un Orc de prendre la hache d'un autre Orc."
const _TEXT_5 = "Mais je t'ai déjà dis que c'etait Maya qui m'as confié ta hache comme punition pour la casse que tu as causé ici hier soir."
const _TEXT_6 = "Je ne m'en souvies pas.
Rend moi ma hache."
const _TEXT_7 = "C'est un dialogue de sourd..."
