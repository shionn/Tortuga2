extends MarginContainer

@onready var gui := $"/root/World/Gui" as Gui
@onready var bag := $"/root/World/Gui/Bag" as Bag
@onready var player = $"/root/World/Player" as Player
@onready var tags = $"/root/World/Player/Tags" as Tags

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_panel") :
		visible = not visible

func _on_quick_load_pressed() -> void:
	bag.load_game()
	player.tags.load_game()
	gui.append_to_console("Partie chargée")
	visible = false

func _on_quick_save_pressed() -> void:
	bag.save_game()
	player.tags.save_game()
	gui.append_to_console("Partie sauvegardée")
	visible = false

func _on_teleport_hung_connut_pressed() -> void:
	player.teleport(Vector3(300, 26, -240), 72) # hung connu
	visible = false

func _on_teleport_oasis_pressed() -> void:
	player.teleport(Vector3(172.0,105.0,-253.0), 0) # oasis
	visible = false

func _on_teleport_chaman_pressed() -> void:
	player.teleport(Vector3(304.0,2.1,91), 0) # oasis
	visible = false

func _on_teleport_escalator_pressed() -> void:
	player.teleport(Vector3(257, 2, -316), -49) # escalator
	visible = false

func _on_teleport_twin_island_pressed() -> void:
	player.teleport(Vector3(250, 2, -1720), 0) 
	visible = false

func _on_teleport_teleport_stone_pressed() -> void:
	player.teleport(Vector3(75, 3, -186), deg_to_rad(8)) 
	visible = false

func _on_teleport_kindle_pressed() -> void:
	player.teleport(Vector3(-19, 1.6, -293), deg_to_rad(57)) 
	visible = false
