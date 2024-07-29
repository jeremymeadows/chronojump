extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.finish()
	$Flag.stop()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file('res://ui/next_level.tscn')


func _on_flag_animation_finished() -> void:
	if $Flag.frame == 0:
		$Flag.play()
		$Flag.frame += 1
	else:
		$Flag.play_backwards()
		$Flag.frame -= 1
