extends "res://scripts/interactable.gd"

static var tries = 0

func on_interact() -> void:
	if bag.contain(Bag.SelDeMontagne):
		player.play_anim_no()
		gui.open_alert("Minage", "J'ai assez de sel")
	elif (bag.contain(Bag.Pioche)) :
		visible = false
		tries = tries + 1
		if randi_range(0,100) > 90 or tries >= 15:
			bag.loot(Bag.SelDeMontagne)
		else :
			gui.open_alert("Minage", "Il n'y a rien d'exploitable.")
	else : 
		player.play_anim_no()
		gui.open_alert("Minage", "Il me faudrait un outil pour extraire quoique ce soit.")
