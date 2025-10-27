extends Node
## Procedural world generation using noise

const WORLD_WIDTH = 64
const WORLD_HEIGHT = 64
const TILE_SIZE = 16
const RESOURCE_SPAWN_THRESHOLD = 0.3  # Higher noise values spawn resources

# Tile type colors (placeholder visuals)
const LIGHT_COLORS = {
	"grass": Color(0.2, 0.7, 0.2),      # Green
	"water": Color(0.2, 0.4, 0.8),      # Blue
	"tree": Color(0.1, 0.4, 0.1),       # Dark green
}

const DARK_COLORS = {
	"metal": Color(0.5, 0.5, 0.5),      # Gray
	"energy": Color(0.2, 0.8, 0.9),     # Cyan
	"structure": Color(0.3, 0.3, 0.4),  # Dark gray
}

var world_seed: int = 0
var noise: FastNoiseLite
var resource_node_scene = preload("res://scenes/resources/resource_node.tscn")

func generate_world(seed_value: int, world_container: Node2D, is_light: bool):
	world_seed = seed_value

	# Initialize noise
	noise = FastNoiseLite.new()
	noise.seed = world_seed if is_light else world_seed + 1
	noise.frequency = 0.05
	noise.fractal_octaves = 3

	# Clear existing tiles
	for child in world_container.get_children():
		child.queue_free()

	# Generate tiles and resources
	for y in range(WORLD_HEIGHT):
		for x in range(WORLD_WIDTH):
			var tile = create_tile(x, y, is_light)
			world_container.add_child(tile)

			# Spawn resource nodes at appropriate locations
			var noise_value = noise.get_noise_2d(x, y)
			if noise_value > RESOURCE_SPAWN_THRESHOLD:
				var resource = spawn_resource(x, y, is_light)
				world_container.add_child(resource)

func create_tile(x: int, y: int, is_light: bool) -> ColorRect:
	var noise_value = noise.get_noise_2d(x, y)

	var tile = ColorRect.new()
	tile.position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
	tile.size = Vector2(TILE_SIZE, TILE_SIZE)

	# Choose color based on noise value and world type
	if is_light:
		if noise_value < -0.2:
			tile.color = LIGHT_COLORS["water"]
		elif noise_value < 0.3:
			tile.color = LIGHT_COLORS["grass"]
		else:
			tile.color = LIGHT_COLORS["tree"]
	else:
		if noise_value < -0.2:
			tile.color = DARK_COLORS["energy"]
		elif noise_value < 0.3:
			tile.color = DARK_COLORS["metal"]
		else:
			tile.color = DARK_COLORS["structure"]

	return tile

func spawn_resource(x: int, y: int, is_light: bool) -> Node2D:
	var resource = resource_node_scene.instantiate()
	resource.position = Vector2(x * TILE_SIZE + TILE_SIZE/2, y * TILE_SIZE + TILE_SIZE/2)

	# Set resource type based on world
	if is_light:
		resource.resource_type = 0  # WOOD
	else:
		resource.resource_type = 1  # METAL

	return resource
