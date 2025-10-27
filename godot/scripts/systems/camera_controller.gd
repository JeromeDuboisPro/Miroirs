extends Camera2D
## Camera controller with mouse controls

# Zoom settings
const MIN_ZOOM = 1.0
const MAX_ZOOM = 4.0
const ZOOM_SPEED = 0.1

# Pan settings
const PAN_SPEED = 1.0
const RETURN_SPEED = 10.0

# State
var is_panning = false
var pan_start_position = Vector2.ZERO
var camera_offset = Vector2.ZERO
var target_player: Node2D = null
var returning_to_player = false

func _ready():
	# Find player in parent scene
	target_player = get_parent().get_node("Player")
	if target_player:
		position = target_player.position

func _input(event):
	# Mouse wheel zoom
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_camera(ZOOM_SPEED)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_camera(-ZOOM_SPEED)

		# Middle mouse button pan
		elif event.button_index == MOUSE_BUTTON_MIDDLE:
			if event.pressed:
				start_panning()
			else:
				stop_panning()

	# Mouse motion while panning
	if event is InputEventMouseMotion and is_panning:
		pan_camera(event.relative)

	# Space bar to recenter
	if event.is_action_pressed("ui_select"):  # Space bar
		recenter_on_player()

func _process(delta):
	# Smooth return to player after panning
	if returning_to_player and target_player:
		camera_offset = camera_offset.lerp(Vector2.ZERO, RETURN_SPEED * delta)
		position = target_player.position + camera_offset

		# Stop returning when close enough
		if camera_offset.length() < 1.0:
			camera_offset = Vector2.ZERO
			returning_to_player = false

	# Follow player when not panning
	elif not is_panning and target_player:
		position = target_player.position + camera_offset

func zoom_camera(amount: float):
	var new_zoom = zoom.x + amount
	new_zoom = clamp(new_zoom, MIN_ZOOM, MAX_ZOOM)
	zoom = Vector2(new_zoom, new_zoom)

func start_panning():
	is_panning = true
	returning_to_player = false
	pan_start_position = get_global_mouse_position()

func stop_panning():
	is_panning = false
	returning_to_player = true

func pan_camera(motion: Vector2):
	# Pan camera opposite to mouse motion
	camera_offset -= motion / zoom.x * PAN_SPEED

func recenter_on_player():
	# Immediate snap to player
	camera_offset = Vector2.ZERO
	returning_to_player = false
	if target_player:
		position = target_player.position
