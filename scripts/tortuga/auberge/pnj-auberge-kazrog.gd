extends PNJ


func on_interact() -> void:
	if tags.have(Tags.FOUND_WARRIOR) : 
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_1))
	elif tags.have(Tags.KAZROG_HAVE_AXE) :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_2)
			.option_search_cartograph()
			.option_search_warrior()
		)
	elif tags.have(Tags.ORCO_AT_AUBERGE) :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_3))
	else :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_4))


func on_tag_change() -> void:
	visible = tags.have(Tags.KAZROG_AT_AUBERGE)
	if visible: position.y = 2.25
	else : position.y = -10

const _TEXT_1 = "J’ai hâte de partir casser des bras, quand est-ce qu’on part ?"
const _TEXT_2 = "Merci de m’avoir rendu ma hache. Comment puis-je te remercier ?"
const _TEXT_3 = "Tu vois pas que je parle avec Orco ?"
const _TEXT_4 = "Laisse-moi tranquille. Tu ne peux pas comprendre ma douleur. Orco le pourrait mais il a du travail."
