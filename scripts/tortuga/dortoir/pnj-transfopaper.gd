extends PNJ


func _ready() -> void:
	super._ready()
	_sleep()

func on_interact() -> void:
	_awake()

func _sleep() -> void:
	self.rotation.y = 0
	self._character.rotation.x=deg_to_rad(80)
	self._character.rotation.z=deg_to_rad(35)
	self._area.rotation.x=deg_to_rad(80)
	self._area.rotation.z=deg_to_rad(35)
	self.position = Vector3(-1.85, 4.55, 1.7)
	var idle = _animation.get_animation("idle")
	idle.loop_mode = Animation.LOOP_NONE
	_animation.play("idle")

func _awake() -> void:
	self.rotation.y = deg_to_rad(180)
	self._character.rotation=Vector3.ZERO
	self._area.rotation=Vector3.ZERO
	self.position = Vector3(-2.9, 4.02, 2.0)
	var idle = _animation.get_animation("idle")
	idle.loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")
