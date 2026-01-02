extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if bag.contain(Bag.CarteHungConnut) :
		gui.open_dialog("Todo","TODO")
	else :
		gui.open_alert("Gravure étrange", "Quel étrange gravure")
