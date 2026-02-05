extends "res://scripts/props/chest.gd"


func on_interact() -> void:
	if tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED) :
		gui.open_alert("Coffre vide", "Le coffre est vide")
	else :
		gui.open_question("Je suis moi, mais je ne suis personne car on ne me connait pas, mais je suis moi quoi qu’il en soit! Qui suis-je ?", _on_answer, Vector2(350,150))

func _on_answer(answer:String) -> void:
	if answer.to_lower() == "inconnu" : 
		tags.add(Tags.HUNG_CONNUT_TEASUR_OPENED)
		bag.loot(Bag.TresorHungConnut)
	else :
		gui.open_alert("Mauvais code", "Le coffre ne s'ouvre pas.")
		
func on_tag_change() -> void:
	if tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED) : open()
	else : close()
