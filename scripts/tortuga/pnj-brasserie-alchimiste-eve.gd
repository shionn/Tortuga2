extends "res://scripts/pnj.gd"

const _TEXT_PRESENTATION = """Bonjour, 

Je suis Eve l'alchimiste de l'île, je sais faire de puissante potion. 
Mais je suis surtout connu pour ma bière et mon rhum."""

const _TEXT_PARCHEMIN_BARBE_DRUE = """Hum ce parchemin n’est pas dans langue étrangère, mais il est codé, je peux te le décoder mais je ne peux pas encore le faire. 
	
Pour avancer plus loin, il nous faut accomplir une quête de peinture. 
Pour prouvez que vous avez fini cette quête reporter le code \"Par ma barbe rousse et drue\" dans le canal discord des quêtes. 
Cela permettra de lancer la quête de peinture qui débloquerait la suite."""

func on_interact() -> void:
	open_text(pnj_name, _TEXT_PRESENTATION)

func on_item_drop(item : Item) -> void:
	if item.name == "ParcheminBarbeDrue" :
		open_text(pnj_name, _TEXT_PARCHEMIN_BARBE_DRUE)
		gui.append_to_console("Félicitation, vous avez achevé la première quête. Penser à sauvegarder.")
	else : 
		super.on_item_drop(item)
