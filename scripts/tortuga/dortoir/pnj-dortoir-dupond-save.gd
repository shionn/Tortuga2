extends "res://scripts/pnj.gd"

const _TEXT = """Je peux sauvegarder votre partie si vous le souhaitez.
Voulez-vous sauvegarder votre partie ?"""

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
		.on_yes_no(_on_no, _on_yes)
	)
	
func _on_no() -> void:
	player.play_anim_no()
	pass

func _on_yes() -> void:
	player.play_anim_yes()
	bag.save_game()
	player.tags.save_game()
	gui.append_to_console("Partie sauvegardée")
	pass
