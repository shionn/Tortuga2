extends "res://scripts/interactable.gd"

@onready var orco = $"../pnj-orco" as PNJ

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, _DESCRIPTION)
		.option_action("Oui", _on_yes)
		.option_action("Non", func() : player.play_anim_no())
	)

func _on_yes() -> void : 
	if (tags.have(Tags.ORCO_AT_AUBERGE)) : 
		bag.loot(Bag.HacheKazrog)
	else :
		gui.open_dialog_next(Dialog.pnjSay(orco, _ORCO_DO_NOT_TOUCH))

func on_item_change() -> void:
	visible = not bag.contain(Bag.HacheKazrog) && not tags.have(Tags.KAZROG_HAVE_AXE)

func on_tag_change() -> void:
	visible = not bag.contain(Bag.HacheKazrog) && not tags.have(Tags.KAZROG_HAVE_AXE)

const _DESCRIPTION = "Sur la hache il est écrit : 
[i]Propriété de Kazrog[/i]

Je la prend ?"

const _ORCO_DO_NOT_TOUCH = "Ne touche pas à ça. 

Une hache, c'est sacrée."
