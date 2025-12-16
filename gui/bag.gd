extends Control

func _on_visibility_changed() -> void:
	if visible :
		print("refresh bag content")
	pass # Replace with function body.


func _on_close_button_pressed() -> void:
	hide()
