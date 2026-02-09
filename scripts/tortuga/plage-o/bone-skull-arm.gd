extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if bag.contain(Bag.ListInvocationVent) :
		if tags.have(Tags.KNOW_BONE_SKULL_STORY):
			gui.open_dialog_next(Dialog.playerSay(player, TEXT_3)
				.on_yes_no( _on_no, _on_yes)
			)
		else :
			player.play_anim_no()
			gui.open_dialog_next(Dialog.playerSay(player, TEXT_2))
	else : 
		gui.open_dialog_next(Dialog.playerSay(player, "Ça ressemble à un os. Ca ressemble même à une main. 
Hmm qu'est ce que j'en ferai ?"))

func _on_no() : 
	player.play_anim_no()

func _on_yes() : 
	bag.loot(Bag.Ossement)
	tags.remove(Tags.KNOW_BONE_SKULL_STORY)

func on_item_change() -> void:
	visible = not bag.contain(Bag.Ossement)


const TEXT_2 = """Tiens c’est un ossement, ça ressemble même à une main. J’ai besoin d’un ossement de pirate justement, mais rien ne m’assure que c’en est un. Si ce n’est pas le cas, il ne me servira à rien...

Si seulement je savais d’où il provient. GRRR, ça fait froid dans le dos."""

const TEXT_3 = """Tiens c’est un ossement, mais ce ne serait pas la main de Boneskull. Est-ce que je le ramasse ?"""
