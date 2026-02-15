extends PNJ


func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, "Hum c’est ici qu’on sert les meilleurs bloody marie."))
