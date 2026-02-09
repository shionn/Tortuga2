extends "res://scripts/pnj.gd"

func on_tag_change() -> void:
	visible = tags.have(Tags.TOMB_BARBE_DRUE_OPENED)

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, """Profanateur ! Laisses moi tranquille et ne m’adresse pas la parole !"""))
