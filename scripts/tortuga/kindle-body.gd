extends CharacterBody3D

class_name KindleBody

@onready var player = $"/root/World/Player" as Player
@onready var pnj = $KindlePnj as PNJ

var follow = false
var walk = false

func _physics_process(delta: float) -> void:
	velocity = Vector3.ZERO
	if follow :
		self.look_at(player.global_position, Vector3.UP, true)
		var dist = self.global_position.distance_to(player.global_position)
		walk = dist > 2 and dist < 8
		if walk :
			pnj._animation.play("Run")
			var move = player.global_position - self.global_position
			move.y = 0
			move = move.normalized()
			velocity = move*4
		else :
			pnj._animation.play("Idle")
	move_and_slide()
