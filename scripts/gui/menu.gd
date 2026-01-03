extends Control

@onready var _bag = $"../Bag" as Control
@onready var _gui = $".." as Gui

func _on_bag_button_pressed() -> void:
	if _bag.visible : _bag.hide()
	else : _bag.show()


func _on_exit_button_pressed() -> void:
	_gui.open_yes_no_question("Quitter", _SAVE_TEXT, _on_exit_no, _on_exit_yes)

func _on_exit_yes() -> void:
	get_tree().quit()

func _on_exit_no() -> void: 
	pass

const _SAVE_TEXT = """Voulez vous quitter le jeu ?
Toute progression non sauvegardée sera perdue."""
