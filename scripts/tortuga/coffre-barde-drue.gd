extends "res://scripts/interactable.gd"



func on_interact() -> void:
	open_question("Entrez le code", on_answer)

func on_answer(answer: String) -> void:
	if answer == "14738":
		open_dialog_and_img("Félicitation", """Vous avez résolut l'énigme du trésor de Brabre drue.

Dane le coffre en plus du trésor, vous trouver un parchemin, mais vous ne comprenez rien à ce qui est écris dessus. 
Peut-être que quelqu'un au village saura qu'en faire. 

Pour prouvez que vous avez fini cette quête reporter le code \"Par ma barbe rousse et drue\" dans le canal discord des quêtes.

TODO Revoir ce dialog et cette image""", load("res://assets/imgs/treasures.png"))
	else :
		open_alert("Mauvais code", "Le coffre ne s'ouvre pas.")
