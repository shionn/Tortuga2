extends "res://scripts/pnj.gd" 

var follow = false
var walk = false

func on_interact() -> void:
	follow = !follow

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
