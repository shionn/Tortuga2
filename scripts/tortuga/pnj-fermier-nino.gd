extends "res://scripts/pnj.gd"


func on_interact() -> void:
	open_text(pnj_name, _TEXT)

const _TEXT = """Bonjour aventurier.ère, je suis le seul jardinier de l’île. Ne marche pas dans mes cultures. Si vous abîmez mes cultures, nous n’aurons plus de houblon pour que Eve puisse en faire de la bonne bière !

Et si il n’y a plus de bière, nous courons vers une mutinerie certaine. 

J’ai de nombreuses autres connaissances en botanique. Mais avoir du bon houblon pour de la bonne bière est une priorité absolue."""
