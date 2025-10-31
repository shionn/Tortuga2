extends Area3D


func _on_body_entered(body: Node3D) -> void:
	print("enter")


func _on_area_entered(area: Area3D) -> void:
	print("_on_area_entered")


func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	print("_on_body_shape_entered")
