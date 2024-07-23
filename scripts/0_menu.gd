extends Control


# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey and event.pressed:
		get_tree().change_scene_to_file('res://scenes/game.tscn')
