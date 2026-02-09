extends "res://scripts/interactable.gd"

func _ready() -> void:
	super._ready()
	FixColor.fix(self)

func on_interact() -> void:
	if player.tags.have(Tags.FORBID_FRUIT_SEARCH) && !bag.contain(Bag.Melon):
		self.visible = false
		bag.loot(Bag.Melon)
	else :
		gui.open_dialog_next(Dialog.playerSay(player, "Ces melons semblent délicieux"))
