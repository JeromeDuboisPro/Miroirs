extends CharacterBody2D
## Base enemy class with health, AI, and combat detection

enum EnemyState { IDLE, PATROL, COMBAT, DEAD }

const WORLD_SIZE = Vector2(1024, 1024)  # 64x64 tiles * 16px
const WORLD_MARGIN = 6.0  # Half of enemy size

@export var enemy_type: String = "basic"
@export var patrol_speed: float = 40.0
@export var patrol_radius: float = 64.0
@export var detection_radius: float = 80.0
@export var max_health: int = 60
@export var world_type: int = 0  # 0 = Light, 1 = Dark

@onready var health_component = $HealthComponent
@onready var sprite = $Sprite

var current_state: EnemyState = EnemyState.IDLE
var spawn_position: Vector2
var patrol_target: Vector2
var player: Node2D = null
var patrol_timer: float = 0.0
var patrol_wait_time: float = 2.0  # Wait 2s at each patrol point

func _ready():
	# Clamp spawn position to world boundaries
	global_position.x = clamp(global_position.x, WORLD_MARGIN, WORLD_SIZE.x - WORLD_MARGIN)
	global_position.y = clamp(global_position.y, WORLD_MARGIN, WORLD_SIZE.y - WORLD_MARGIN)

	spawn_position = global_position
	patrol_target = spawn_position

	# Configure health component
	health_component.max_health = max_health
	health_component.died.connect(_on_died)
	health_component.respawned.connect(_on_respawned)

	# Find player
	player = get_tree().get_root().get_node("Main/Player")

	# Start in patrol state
	current_state = EnemyState.PATROL
	_choose_new_patrol_target()

func _physics_process(delta):
	if current_state == EnemyState.DEAD:
		return

	# Check if we're in the correct world
	var game_manager = get_tree().get_root().get_node("Main")
	var is_correct_world = (game_manager.current_world_type == world_type)

	# Only detect player if in correct world
	if is_correct_world and player and player.health_component.is_alive():
		var distance_to_player = global_position.distance_to(player.global_position)

		if distance_to_player <= detection_radius:
			if current_state != EnemyState.COMBAT:
				_enter_combat_state()
		else:
			if current_state == EnemyState.COMBAT:
				_exit_combat_state()
	else:
		# Exit combat if switched worlds
		if current_state == EnemyState.COMBAT:
			_exit_combat_state()

	# State-based behavior
	match current_state:
		EnemyState.PATROL:
			_patrol_behavior(delta)
		EnemyState.COMBAT:
			_combat_behavior(delta)

func _patrol_behavior(delta):
	# Move towards patrol target
	var direction = (patrol_target - global_position).normalized()
	var distance = global_position.distance_to(patrol_target)

	if distance > 5.0:
		velocity = direction * patrol_speed
		move_and_slide()

		# Clamp position to world boundaries
		global_position.x = clamp(global_position.x, WORLD_MARGIN, WORLD_SIZE.x - WORLD_MARGIN)
		global_position.y = clamp(global_position.y, WORLD_MARGIN, WORLD_SIZE.y - WORLD_MARGIN)
	else:
		# Reached patrol point, wait before choosing new target
		velocity = Vector2.ZERO
		patrol_timer += delta

		if patrol_timer >= patrol_wait_time:
			patrol_timer = 0.0
			_choose_new_patrol_target()

func _choose_new_patrol_target():
	# Pick random point within patrol radius
	var angle = randf() * TAU
	var distance = randf() * patrol_radius
	patrol_target = spawn_position + Vector2(cos(angle), sin(angle)) * distance

	# Clamp patrol target to world boundaries
	patrol_target.x = clamp(patrol_target.x, WORLD_MARGIN, WORLD_SIZE.x - WORLD_MARGIN)
	patrol_target.y = clamp(patrol_target.y, WORLD_MARGIN, WORLD_SIZE.y - WORLD_MARGIN)

func _combat_behavior(_delta):
	# Stop moving during combat (Phase 3 will add combat actions)
	velocity = Vector2.ZERO

func _enter_combat_state():
	current_state = EnemyState.COMBAT
	sprite.modulate = Color(1.0, 0.8, 0.8)  # Slight red tint in combat
	print(enemy_type, " enemy entered combat!")

	# TODO Phase 3: Initiate combat with combat_manager

func _exit_combat_state():
	current_state = EnemyState.PATROL
	sprite.modulate = Color(1.0, 1.0, 1.0)
	_choose_new_patrol_target()
	print(enemy_type, " enemy exited combat")

func take_damage(amount: int):
	health_component.take_damage(amount)

func _on_died():
	current_state = EnemyState.DEAD
	visible = false
	print(enemy_type, " enemy died!")

	# Drop resources
	_drop_resources()

	# Remove after 5 seconds
	await get_tree().create_timer(5.0).timeout
	queue_free()

func _on_respawned():
	# Enemies don't respawn, but kept for consistency
	pass

func _drop_resources():
	# TODO Phase 4: Drop resources based on enemy type
	print(enemy_type, " enemy dropped resources")

# Visual feedback for taking damage (inherited from health_component)
func _process(_delta):
	if health_component.is_invulnerable:
		# Blink effect handled by health_component
		pass
