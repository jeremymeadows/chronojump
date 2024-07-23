extends CharacterBody2D

signal freeze
signal rewind
signal start

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var path = []
var running = false

func _physics_process(delta: float) -> void:
	if running:
		path.append(self.position)
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("jump"):
		velocity.y += gravity * delta * 16
	
	if Input.is_action_just_pressed('rewind'):
		freeze.emit()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func finish() -> void:
	running = false
	set_physics_process(false)

func _on_freeze() -> void:
	set_physics_process(false)
	running = false
	await get_tree().create_timer(1).timeout
	rewind.emit()

func _on_rewind() -> void:
	path = []
	set_physics_process(true)

func _input(event):
	if not running and event is InputEventKey and event.pressed and is_physics_processing():
		start.emit()
		running = true
