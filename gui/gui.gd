extends Control

@onready var _player := $"../Player" as CharacterBody3D
@onready var _debug_info := $DebugInfo as Label
@onready var _dialog := $Left/Dialog as Panel
@onready var _dialog_text := $Left/Dialog/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel

func openDialog(text: String) -> void: 
	_dialog_text.clear()
	_dialog_text.add_text(text)
	_dialog.show()

func _process(delta: float) -> void:
	_debug_info.text = str(_player.global_position)
	_debug_info.text += "\nfps: " + str(Engine.get_frames_per_second())


func _on_close_dialog_button_pressed() -> void:
	_dialog.hide()
