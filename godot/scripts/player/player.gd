extends CharacterBody2D
## Player character with WASD/Arrow key movement

const SPEED = 150.0

func _physics_process(_delta):
	# Get input direction (both WASD and Arrow keys)
	var direction = Input.get_vector(
		"ui_left",    # Left arrow / A
		"ui_right",   # Right arrow / D
		"ui_up",      # Up arrow / W
		"ui_down"     # Down arrow / S
	)

	# Apply movement
	velocity = direction * SPEED
	move_and_slide()
