extends "res://scripts/pnj.gd"

var follow = false
var walk = false

func on_interact() -> void:
	pass
	#follow = !follow
	
func _physics_process(delta: float) -> void:
	if follow :
		self.look_at(player.global_position, Vector3.UP, true)
		walk = self.global_position.distance_to(player.global_position) > 2
		if walk :
			_animation.play("Run")
			var move = player.global_position - self.global_position
			move = move.normalized()
			self.global_position += move*delta*4
		else :
			_animation.play("Idle")
		
