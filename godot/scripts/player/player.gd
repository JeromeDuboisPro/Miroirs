extends CharacterBody2D
## Player character with WASD/Arrow key movement

const SPEED = 120.0  # 20% slower for better control

func _physics_process(_delta):
	# Get input direction (Arrows + WASD/ZQSD support)
	var direction = Input.get_vector(
		"ui_left",    # Left arrow
		"ui_right",   # Right arrow
		"ui_up",      # Up arrow
		"ui_down"     # Down arrow
	)

	# Add WASD/ZQSD support
	direction += Input.get_vector(
		"move_left",   # A or Q (AZERTY)
		"move_right",  # D
		"move_up",     # W or Z (AZERTY)
		"move_down"    # S
	)

	# Apply movement
	velocity = direction * SPEED
	move_and_slide()
