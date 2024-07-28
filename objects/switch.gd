extends Area2D


@export
var color: Color = Color(1, 1, 1)


func _ready() -> void:
	$AnimatedSprite2D.self_modulate = color


func _on_body_entered(_body: Node2D) -> void:
	$AnimatedSprite2D.frame = 1


func _on_body_exited(_body: Node2D) -> void:
	$AnimatedSprite2D.frame = 0
