extends Node2D
## Manages dual-world system and world switching

enum WorldType { LIGHT, DARK }

@export var current_world: WorldType = WorldType.LIGHT

@onready var light_world = $LightWorld
@onready var dark_world = $DarkWorld
@onready var player = $Player

func _ready():
	# Start in Light world
	switch_to_world(WorldType.LIGHT)

func _input(event):
	# Tab key to switch worlds
	if event.is_action_pressed("ui_cancel"):  # Tab key (we'll configure this)
		toggle_world()

func toggle_world():
	if current_world == WorldType.LIGHT:
		switch_to_world(WorldType.DARK)
	else:
		switch_to_world(WorldType.LIGHT)

func switch_to_world(world_type: WorldType):
	current_world = world_type

	if world_type == WorldType.LIGHT:
		light_world.visible = true
		dark_world.visible = false
		print("Switched to Light World")
	else:
		light_world.visible = false
		dark_world.visible = true
		print("Switched to Dark World")
