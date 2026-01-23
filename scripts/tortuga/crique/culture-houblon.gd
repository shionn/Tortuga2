extends "res://scripts/interactable.gd"

func _ready() -> void:
	super._ready()
	FixColor.fix(self)

func on_interact() -> void:
	if player.tags.have(Tags.CAN_LOOT_HOUBLON) :
		if !bag.contain(Bag.Houblon):
			self.visible = false
			bag.loot(Bag.Houblon)
		else :
			gui.open_alert("Houblon", "J'en ai assez.")
			player.play_anim_no()
	else : 
		gui.open_alert("Houblon", "Je ne peux pas en ramasser sans l'autorisation de Nino.")
		player.play_anim_no()
