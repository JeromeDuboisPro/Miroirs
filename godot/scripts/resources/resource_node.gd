extends Area2D
## Resource node (tree or metal deposit) with harvesting and regeneration

enum ResourceType { WOOD, METAL }

@export var resource_type: ResourceType = ResourceType.WOOD
@export var resource_amount: int = 1
@export var regeneration_time: float = 60.0  # seconds
@export var world_type: int = 0  # 0 = Light, 1 = Dark

var is_depleted: bool = false
var can_harvest: bool = false
var player_nearby: Node2D = null
var regeneration_timer: float = 0.0

@onready var sprite = $ColorRect
@onready var interaction_icon = $InteractionIcon

func _ready():
	# Set up collision detection
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

	# Hide interaction icon initially
	interaction_icon.visible = false

	# Set resource appearance
	_update_appearance()

func _process(delta):
	# Handle regeneration
	if is_depleted:
		regeneration_timer += delta
		if regeneration_timer >= regeneration_time:
			_regenerate()

	# Check if we're in the correct world
	var game_manager = get_tree().get_root().get_node("Main")
	var is_correct_world = (game_manager.current_world_type == world_type)

	# Show interaction icon only when in correct world, player nearby, and not depleted
	interaction_icon.visible = can_harvest and not is_depleted and is_correct_world

	# Handle harvest input (only in correct world)
	if can_harvest and not is_depleted and is_correct_world and Input.is_action_just_pressed("interact"):
		_harvest()

func _on_body_entered(body):
	if body.name == "Player":
		can_harvest = true
		player_nearby = body

func _on_body_exited(body):
	if body.name == "Player":
		can_harvest = false
		player_nearby = null

func _harvest():
	if is_depleted:
		return

	# Get game manager to update inventory and handle cross-world transformation
	var game_manager = get_tree().get_root().get_node("Main")
	if game_manager:
		game_manager.add_resource(resource_type, resource_amount)
		# Trigger cross-world transformation at this position
		game_manager.transform_resource_across_worlds(global_position, resource_type)

	# Play harvest animation
	_play_harvest_animation()

	# Mark as depleted
	is_depleted = true
	regeneration_timer = 0.0
	_update_appearance()

	print("Harvested ", ResourceType.keys()[resource_type], " (+", resource_amount, ")")

func _regenerate():
	is_depleted = false
	_update_appearance()
	print(ResourceType.keys()[resource_type], " resource regenerated")

func _update_appearance():
	if is_depleted:
		# Faded/grey appearance when depleted
		sprite.modulate = Color(0.5, 0.5, 0.5, 0.5)
	else:
		# Full color when available
		sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)

		# Set color based on resource type
		if resource_type == ResourceType.WOOD:
			sprite.color = Color(0.4, 0.6, 0.2)  # Green for trees
		else:
			sprite.color = Color(0.6, 0.6, 0.7)  # Grey for metal

func _play_harvest_animation():
	# Simple scale pulse animation
	var tween = create_tween()
	tween.tween_property(sprite, "scale", Vector2(1.3, 1.3), 0.1)
	tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.1)
