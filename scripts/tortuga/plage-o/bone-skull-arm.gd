extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if bag.contain(Bag.ListInvocationVent) :
		if tags.have(Tags.KNOW_BONE_SKULL_STORY):
			bag.loot(Bag.Ossement)
			tags.remove(Tags.KNOW_BONE_SKULL_STORY)
		else :
			player.play_anim_no()
			gui.open_alert("Ossement","Oui c’est un ossement, mais j’ai besoin d’un ossement de pirate, rien ne m’assure que c’est un le cas. Il me servira à rien.")
	else : 
		gui.open_alert("Ossement","Ça ressemble à un os.")
		
		
func on_item_change() -> void:
	visible = not bag.contain(Bag.Ossement)
