extends Control


func _on_start_pressed() -> void:
	Global.level = 0


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file('res://ui/levels.tscn')


func _on_quit_pressed() -> void:
	Global.quit()
