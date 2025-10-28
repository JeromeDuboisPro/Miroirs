extends Node2D
## Main game manager - initializes worlds and handles game loop

@onready var world_generator = $WorldGenerator
@onready var light_world = $LightWorld/TileContainer
@onready var dark_world = $DarkWorld/TileContainer
@onready var world_label = $UI/HUD/WorldLabel
@onready var inventory_label = $UI/HUD/InventoryLabel
@onready var health_bar = $UI/HUD/HealthBar
@onready var health_label = $UI/HUD/HealthLabel
@onready var player = $Player
@onready var world_manager = self  # This script is on the Main node

var current_world_type = 0  # 0 = Light, 1 = Dark

# Inventory system with 999 cap per resource
const MAX_RESOURCE = 999
var inventory = {
	"wood": 0,
	"metal": 0
}

func _ready():
	# Load world generator script
	var generator_script = load("res://scripts/systems/world_generator.gd")
	world_generator.set_script(generator_script)

	# Generate both worlds with same seed
	var seed_value = randi()
	print("Generating worlds with seed: ", seed_value)
	world_generator.generate_world(seed_value, light_world, true)
	world_generator.generate_world(seed_value, dark_world, false)

	print("World generation complete!")
	print("Controls:")
	print("  Arrows or ZQSD/WASD: Move player")
	print("  Tab: Switch worlds")
	print("  E: Harvest resources (trees in Light = wood, deposits in Dark = metal)")
	print("  Mouse Wheel: Zoom camera")
	print("  Middle Mouse Button: Pan camera (hold and drag)")
	print("  Space: Recenter camera on player")
	print("  T: [DEBUG] Take 20 damage (test health system)")
	print("  Y: [DEBUG] Damage nearest enemy by 20 HP")
	print("")
	print("Phase 1-2 Complete: Health system + Enemy AI active!")

	# Initialize inventory UI
	update_inventory_ui()

	# Connect player health signals
	if player and player.health_component:
		player.health_component.health_changed.connect(_on_player_health_changed)
		player.health_component.respawned.connect(_on_player_respawned)
		update_health_ui()

func _input(event):
	# Tab key to switch worlds
	if event.is_action_pressed("switch_world"):
		toggle_world()

	# DEBUG: Damage nearest enemy with Y key
	if event is InputEventKey and event.pressed and not event.echo:
		if event.physical_keycode == 89:  # Y key
			_debug_damage_nearest_enemy()

func toggle_world():
	current_world_type = 1 - current_world_type

	if current_world_type == 0:
		$LightWorld.visible = true
		$DarkWorld.visible = false
		world_label.text = "Light World (Nature)"
		world_label.modulate = Color(0.2, 0.8, 0.2)
	else:
		$LightWorld.visible = false
		$DarkWorld.visible = true
		world_label.text = "Dark World (Tech)"
		world_label.modulate = Color(0.5, 0.8, 1.0)

func add_resource(resource_type: int, amount: int):
	var resource_name = "wood" if resource_type == 0 else "metal"

	# Apply 999 cap
	inventory[resource_name] = min(inventory[resource_name] + amount, MAX_RESOURCE)

	# Update UI
	update_inventory_ui()

	# Check if at cap
	if inventory[resource_name] >= MAX_RESOURCE:
		print(resource_name.capitalize(), " at maximum capacity (999)")

func update_inventory_ui():
	inventory_label.text = "Wood: %d | Metal: %d" % [inventory["wood"], inventory["metal"]]

func transform_resource_across_worlds(harvest_position: Vector2, harvested_type: int):
	# Cross-world transformation: harvesting in one world spawns resource in the other
	# Wood (Light) → Metal (Dark), Metal (Dark) → Wood (Light)

	var target_world: Node2D
	var new_resource_type: int

	# Determine which world to spawn in and what type
	if harvested_type == 0:  # Harvested WOOD in Light world
		target_world = dark_world
		new_resource_type = 1  # Spawn METAL in Dark world
		print("⚡ Mirror transformation: Tree → Metal deposit in Dark world")
	else:  # Harvested METAL in Dark world
		target_world = light_world
		new_resource_type = 0  # Spawn WOOD in Light world
		print("⚡ Mirror transformation: Metal → Tree in Light world")

	# Load resource scene and spawn at same position in other world
	var resource_scene = load("res://scenes/resources/resource_node.tscn")
	var new_resource = resource_scene.instantiate()
	new_resource.global_position = harvest_position
	new_resource.resource_type = new_resource_type

	# Add to target world
	target_world.add_child(new_resource)

	print("  Spawned at position: ", harvest_position)

func _on_player_health_changed(old_value: int, new_value: int):
	update_health_ui()

func _on_player_respawned():
	update_health_ui()
	print("Player respawned - HP restored to full!")

func update_health_ui():
	if not player or not player.health_component:
		return

	var current_hp = player.health_component.current_health
	var max_hp = player.health_component.max_health

	health_bar.value = current_hp
	health_bar.max_value = max_hp
	health_label.text = "HP: %d/%d" % [current_hp, max_hp]

	# Color health bar based on health percentage
	var health_percent = float(current_hp) / float(max_hp)
	if health_percent > 0.6:
		health_bar.modulate = Color(0.2, 0.8, 0.2)  # Green
	elif health_percent > 0.3:
		health_bar.modulate = Color(0.9, 0.7, 0.2)  # Yellow
	else:
		health_bar.modulate = Color(0.9, 0.2, 0.2)  # Red

func _debug_damage_nearest_enemy():
	# Find nearest enemy in current world
	var current_world = light_world if current_world_type == 0 else dark_world
	var nearest_enemy: Node2D = null
	var nearest_distance = INF

	for child in current_world.get_children():
		if child.name.begins_with("Enemy"):
			var distance = player.global_position.distance_to(child.global_position)
			if distance < nearest_distance:
				nearest_distance = distance
				nearest_enemy = child

	if nearest_enemy:
		nearest_enemy.take_damage(20)
		print("DEBUG: Damaged ", nearest_enemy.enemy_type, " enemy for 20 HP (", nearest_enemy.health_component.current_health, " HP remaining)")
	else:
		print("DEBUG: No enemies found in current world")
