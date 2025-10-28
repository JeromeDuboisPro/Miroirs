extends CharacterBody2D
## Player character with WASD/Arrow key movement and health system

const SPEED = 120.0  # 20% slower for better control

@onready var health_component = $HealthComponent

var spawn_position: Vector2 = Vector2(160, 90)  # Default spawn
var can_move: bool = true

func _ready():
	# Store initial spawn position
	spawn_position = global_position

	# Connect health signals
	health_component.died.connect(_on_died)
	health_component.respawned.connect(_on_respawned)
	health_component.health_changed.connect(_on_health_changed)

func _physics_process(_delta):
	# Can't move if dead
	if not can_move:
		velocity = Vector2.ZERO
		return

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

func take_damage(amount: int):
	health_component.take_damage(amount)

func heal(amount: int):
	health_component.heal(amount)

func _on_died():
	print("Player died!")
	can_move = false
	visible = false

	# Auto-respawn after 2 seconds
	await get_tree().create_timer(2.0).timeout
	_respawn()

func _respawn():
	health_component.respawn(spawn_position)

func _on_respawned():
	print("Player respawned!")
	can_move = true
	visible = true

func _on_health_changed(old_value: int, new_value: int):
	print("Player health: ", old_value, " → ", new_value)

# DEBUG: Test damage system (press T to take 20 damage)
func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if event.physical_keycode == 84:  # T key (physical keycode)
			take_damage(20)
			print("DEBUG: Took 20 damage")
