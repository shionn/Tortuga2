extends Interactable

func on_interact() -> void:
	visible = false
	if bag.contain(Bag.Champignon):
		player.play_anim_no()
		gui.open_alert("Récolte", "J'ai assez de Champignon")
	elif randi_range(0,100) > 90:
		bag.loot(Bag.Champignon)
	else:
		gui.open_alert("Récolte", "Il est pourri celui-la")
