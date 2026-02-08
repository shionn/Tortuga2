extends "res://scripts/interactable.gd"

func _ready() -> void:
	super._ready()
	FixColor.fix(self)

func on_interact() -> void:
	if player.tags.have(Tags.CAN_LOOT_HOUBLON) :
		if !bag.contain(Bag.Houblon):
			gui.open_dialog_next(Dialog.playerSay(player, _TEXT_3).on_close(on_loot))
		else :
			gui.open_dialog_next(Dialog.playerSay(player, _TEXT_2))
			player.play_anim_no()
	else : 
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_1))
		player.play_anim_no()

func on_loot() : 
	self.visible = false
	bag.loot(Bag.Houblon)
	player.play_anim_interact()
	

const _TEXT_1 = "C'est du houblon. C'est graĉe à ce houblon que la bière de eve est si bonne. 
Je ne peux pas en ramasser sans l'autorisation de Nino."

const _TEXT_2 =  "C'est du houblon. C'est graĉe à ce houblon que la bière de eve est si bonne. 
J'en ai assez."

const _TEXT_3 =  "C'est du houblon. C'est graĉe à ce houblon que la bière de eve est si bonne. 
Avec ce houblon, Kindle devrait accepter de me suivre."
