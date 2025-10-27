extends Node2D
## Main game manager - initializes worlds and handles game loop

@onready var world_generator = $WorldGenerator
@onready var light_world = $LightWorld/TileContainer
@onready var dark_world = $DarkWorld/TileContainer
@onready var world_label = $UI/HUD/WorldLabel
@onready var world_manager = self  # This script is on the Main node

var current_world_type = 0  # 0 = Light, 1 = Dark

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
	print("  WASD/Arrows: Move player")
	print("  Tab: Switch worlds")
	print("  Mouse Wheel: Zoom camera")
	print("  Middle Mouse: Pan camera (hold and drag)")
	print("  Space: Recenter camera on player")

func _input(event):
	# Tab key to switch worlds
	if event.is_action_pressed("ui_cancel"):
		toggle_world()

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
