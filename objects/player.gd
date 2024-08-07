extends CharacterBody2D


signal freeze
signal rewind

const SPEED := 160.0
const JUMP_VELOCITY := -448.0
static var GRAVITY: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var jumping = false
var path := []
var frozen := false


func _process(_delta: float) -> void:
	if is_on_floor():
		$Animation.animation = "idle" if velocity.x == 0 else "move"
	else:
		$Animation.animation = "fall" if velocity.x == 0 else "fallmove"
	$Animation.flip_h = velocity.x < 0


func _physics_process(delta: float) -> void:
	if Global.running:
		path.append(self.position)
		
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		jumping = false
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumping = true
		velocity.y = JUMP_VELOCITY
	if jumping and Input.is_action_just_released("jump"):
		velocity.y += GRAVITY * delta * 16
	
	velocity.x = Input.get_axis('move_left', 'move_right') * SPEED
	if velocity.y != 0:
		velocity.x *= 0.8
	
	if Input.is_action_just_pressed('rewind') and Global.running:
		freeze.emit()
	
	if not Global.running and not frozen and velocity.x != 0 or velocity.y < 0:
		Global.running = true
	
	move_and_slide()


func finish() -> void:
	Global.running = false
	set_physics_process(false)
	$Animation.stop()


func _on_freeze() -> void:
	set_physics_process(false)
	Global.running = false
	frozen = true
	await get_tree().create_timer(1).timeout
	rewind.emit()


func _on_rewind() -> void:
	path = []
	set_physics_process(true)
	frozen = false
