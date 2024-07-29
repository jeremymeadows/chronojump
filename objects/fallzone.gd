extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	get_tree().create_timer(0.5).connect("timeout", func(): Global.level = Global.level)
