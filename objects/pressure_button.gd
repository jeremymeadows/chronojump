extends Area2D


@export var animation: String = ""
@export var player: AnimationPlayer


func _on_body_entered(_body: Node2D) -> void:
	$AnimatedSprite2D.play('pressed')
	player.play(animation)


func _on_body_exited(_body: Node2D) -> void:
	$AnimatedSprite2D.play('default')
	player.play_backwards(animation)
