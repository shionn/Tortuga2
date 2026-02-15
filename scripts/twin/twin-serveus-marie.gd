extends PNJ

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_1))
	
	
const _TEXT_1 = """Bonjour qu’est ce que je vous sert ? 

[baille]
Pardon, je suis toujours fatiguée quand Alucard est ici."""
