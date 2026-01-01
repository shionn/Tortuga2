extends Object

class_name PnjDialogOption

var enable : Callable
var title : String
var action : Callable

func _init(enable : Callable, title : String, action : Callable) -> void:
	self.enable = enable
	self.title = title
	self.action = action
