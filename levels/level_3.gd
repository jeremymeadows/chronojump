extends "res://levels/level.gd"


func _on_pressure_button_body_entered(_body: Node2D) -> void:
	for i in range(10):
		get_tree().create_timer(0.1 * i).connect("timeout", func(): $Gate.position.y -= 8)


func _on_pressure_button_body_exited(_body: Node2D) -> void:
	for i in range(10):
		get_tree().create_timer(0.1 * i).connect("timeout", func(): $Gate.position.y += 8)
