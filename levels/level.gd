extends Node2D


@export
var clone: PackedScene
var new_clone

var start_pos = Vector2(0, 0)


func _ready() -> void:
	$Boundary.position.x = start_pos.x - 16
	$Player.position = start_pos


func _on_player_freeze() -> void:
	get_tree().call_group("clones", "stop")
	new_clone = clone.instantiate()
	new_clone.path = $Player.path


func _on_player_rewind() -> void:
	start_pos.x -= 96 + 16
	$Boundary.position.x = start_pos.x - 16;
	$Player.position = start_pos
	$Player/Camera2D.limit_left -= 96 + 16
	
	add_child(new_clone)
	get_tree().call_group("clones", "replay")
