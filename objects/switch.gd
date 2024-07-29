extends Area2D


@export var animation: String = ""
@export var color: Color = Color(1, 1, 1)
@export var player: AnimationPlayer


func _ready() -> void:
	$AnimatedSprite2D.self_modulate = color
	player.get_parent().get_node("Sprite2D").self_modulate = color


func _on_body_entered(_body: Node2D) -> void:
	$AnimatedSprite2D.frame = 1
	player.play(animation)


func _on_body_exited(_body: Node2D) -> void:
	$AnimatedSprite2D.frame = 0
	player.play_backwards(animation)
