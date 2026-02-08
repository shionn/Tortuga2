extends "res://scripts/pnj.gd" 

var follow = false
var walk = false

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self,  "Hii"))

func on_item_drop(item : Item) -> void:
	if item.name == Bag.Houblon :
		follow = true
		gui.open_dialog_next(Dialog.pnjSay(self,  "Hiiiii"))
	else :
		gui.open_dialog_next(Dialog.pnjSay(self,  "Hii"))
		player.play_anim_no()

func on_tag_change() -> void:
	visible = tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) or tags.have(Tags.KINDLE_RETURN_GUSTAF)
	if (tags.have(Tags.KINDLE_RETURN_GUSTAF)):
		follow = false
		global_position = Vector3(32.6,1.44,-49.2)
		rotation.y = deg_to_rad(-168)

func _physics_process(_delta: float) -> void:
	velocity.x = 0
	velocity.z = 0
	if follow :
		look_at(player.global_position, Vector3.UP, true)
		rotation.x = 0
		rotation.z = 0
		var dist = self.global_position.distance_to(player.global_position)
		walk = dist > 2 and dist < 8
		if walk :
			_animation.play("Run")
			var move = player.global_position - self.global_position
			move.y = 0
			move = move.normalized() * 4
			velocity.x = move.x
			velocity.z = move.z
		else :
			_animation.play("Idle")
			if (dist>8) : follow = false
	if !is_on_floor(): 
		velocity += get_gravity()*_delta
	move_and_slide()
