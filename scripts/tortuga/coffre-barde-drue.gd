extends "res://scripts/interactable.gd"

func on_interact() -> void:
	open_question("Entrez le code", on_answer)

func on_answer(answer: String) -> void:
	if answer == "14738":
		print("good")
	else :
		open_alert("Mauvais code", "Le coffre ne s'ouvre pas.")
