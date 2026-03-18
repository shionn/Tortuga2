extends PNJ




func on_interact() -> void:
	if tags.have(Tags.FOUND_WARRIOR) : 
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_1))
	elif tags.have(Tags.KAZROG_HAVE_AXE) :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_2)
			.option_search_forbid_fruit()
			.option_search_forbid_fruit_montain()
			.option_search_forbid_fruit_montain_teleport()
			.option_hung_connut_search_charpentier()
			.option_hung_connut_search_houblon()
			.option_hung_connut_search_wood()
			.option_search_cartograph()
			.option_search_warrior()
		)
	elif tags.have(Tags.ORCO_AT_AUBERGE) :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_3))
	else :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_4))

func on_item_drop(item : Item) -> void: 
	if (item.name == Bag.HacheKazrog) :
		if (tags.have(Tags.ORCO_AT_AUBERGE)) :
			player.play_anim_no()
			gui.open_dialog_next(Dialog.playerSay(player, "Je ne peux pas donner la hache à Kazrog devant Orco !"))
		else :
			player.play_anim_interact()
			gui.open_dialog_next(Dialog.playerSay(player, _TEXT_10)
				.next(Dialog.pnjSay(self, _TEXT_11).on_close(_give_back_axe)))
			pass # TODO
	else :
		super.on_item_drop(item)

func _give_back_axe() -> void : 
	bag.unloot(Bag.HacheKazrog)
	tags.add(Tags.KAZROG_HAVE_AXE)
	tags.remove(Tags.KAZROG_BOIS_TROP_1)
	tags.remove(Tags.KAZROG_BOIS_TROP_2)

func on_tag_change() -> void:
	visible = tags.have(Tags.KAZROG_AT_AUBERGE)
	if visible: position.y = 2.25
	else : position.y = -10

const _TEXT_1 = "J’ai hâte de partir casser des bras, quand est-ce qu’on part ?"
const _TEXT_2 = "Merci de m’avoir rendu ma hache. Comment puis-je te remercier ?"
const _TEXT_3 = "Tu vois pas que je parle avec Orco ?"
const _TEXT_4 = "Laisse-moi tranquille. Tu ne peux pas comprendre ma douleur. Orco le pourrait mais il a du travail."
const _TEXT_10 = "Tiens j’ai récupéré ta hache, ne dis pas à Orco que c’est moi qui te l’ai rendu."
const _TEXT_11 = "Merci ma hache, c’est la plus belle, regarde moi ces formes, ces courbes, son tranchant, son équilibre tout est parfait. 
Orco n’est pas bête, il va vite tout deviner.
Encore merci, j’ai une dette d’honneur envers toi, demande moi ce que tu veux."
