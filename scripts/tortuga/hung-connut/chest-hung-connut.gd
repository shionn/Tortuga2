extends "res://scripts/props/chest.gd"


func on_interact() -> void:
	if tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED) :
		gui.open_dialog_next(Dialog.playerSay(player, "Le cofre est vide"))
	else :
		gui.open_dialog_next(Dialog.playerSay(player, _QUESTION)
			.on_close(func(): gui.open_question("Entrez le code", _on_answer))
		)

func _on_answer(answer:String) -> void:
	if answer.to_lower() == "inconnu" : 
		tags.add(Tags.HUNG_CONNUT_TEASUR_OPENED)
		bag.loot(Bag.TresorHungConnut)
	else :
		gui.open_alert("Mauvais code", "Le coffre ne s'ouvre pas.")
		
func on_tag_change() -> void:
	if tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED) : open()
	else : close()

const _QUESTION = "Sur le coffre il est écrit :
[i]	Je suis moi, mais je ne suis personne car on ne me connait pas, mais je suis moi quoi qu’il en soit! Qui suis-je ?[/i]"
