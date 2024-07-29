extends Control


func _ready() -> void:
	if OS.get_name() == "Web":
		$Quit.queue_free()


func _on_start_pressed() -> void:
	Global.level = 0


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/levels.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/settings.tscn")


func _on_quit_pressed() -> void:
	Global.quit()


func _on_copyright_pressed() -> void:
	OS.shell_open("https://jeremymeadows.dev/")
