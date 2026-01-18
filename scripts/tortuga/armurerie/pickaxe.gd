extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if tags.have(Tags.ALLOW_PICKAXE) :
		bag.loot(Bag.Pioche)
		tags.remove(Tags.ALLOW_PICKAXE)
	elif bag.contain(Bag.ListInvocationVent) : 
		player.play_anim_no()
		gui.open_alert("Non","Prendre quelque chose à l'armurerie sans l'accord de Orco est pure folie." )
	else :
		player.play_anim_no()
		gui.open_alert("Non","Qu'est ce que je ferai d'un hache ?" )

func on_item_change() -> void:
	visible = not bag.contain(Bag.Pioche)
