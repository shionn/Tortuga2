extends Object
class_name DialogOption

var condition: Callable
var title: String
var action: Callable

func _init(_title: String, _action: Callable, _condition: Callable = func() : return true) -> void:
	self.title = _title
	self.action = _action
	self.condition = _condition
