extends CanvasLayer


func _ready() -> void:
	if OS.get_name() == "Web":
		$Quit.queue_free()


func _process(_delta: float) -> void:
	$Time.text = "%.03f" % Global.time


func _on_pause_toggled(toggled_on: bool) -> void:
	get_tree().paused = toggled_on
	$PauseOverlay.visible = toggled_on
	$Pause.text = ">>" if toggled_on else "||"


func _on_restart_pressed() -> void:
	get_tree().paused = false
	Global.level = Global.level


func _on_menu_pressed() -> void:
	Global.main_menu()


func _on_quit_pressed() -> void:
	Global.quit()
