extends Object

class_name PnjDialogOption

var enable : Callable
var title : String
var action : Callable

func _init(_enable : Callable, _title : String, _action : Callable) -> void:
	self.enable = _enable
	self.title = _title
	self.action = _action
