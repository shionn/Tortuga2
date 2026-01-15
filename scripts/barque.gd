extends Interactable

@onready var transition = $"/root/World/Gui/Transition" as ColorRect
@onready var anim = $"/root/World/Gui/Transition/AnimationPlayer" as AnimationPlayer

var fade_in := false;

func _ready() -> void:
	anim.connect("animation_finished", anim_finish);
	super._ready()

func on_interact() -> void:
	fade_in = true;
	transition.visible = true
	anim.play("fade_in")

func anim_finish(anime_name:String) -> void :
	print("anim_finish " +anime_name)
	if fade_in :
		print("middle")
		anim.play_backwards("fade_in")
		fade_in = false
	else : 
		print("end")
		transition.visible = false
