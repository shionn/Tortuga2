extends "res://scripts/pnj.gd"

const _TEXT = """Je peux sauvegarder votre partie si vous le souhaitez.
Voulez-vous sauvegarder votre partie ?"""

func on_interact() -> void:
	gui.open_yes_no_question("Sauvegarde", _TEXT, _on_no, _on_yes)
	
func _on_no() -> void:
	pass

func _on_yes() -> void:
	bag.save_game()
	player.tags.save_game()
	gui.append_to_console("Partie sauvegardée")
	pass
