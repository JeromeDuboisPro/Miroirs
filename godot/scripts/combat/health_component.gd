extends Node
## Reusable health component for any entity (player or enemy)

signal health_changed(old_value: int, new_value: int)
signal died
signal respawned

@export var max_health: int = 100
@export var invulnerability_duration: float = 1.0  # Seconds of invulnerability after taking damage

var current_health: int
var is_dead: bool = false
var is_invulnerable: bool = false
var invulnerability_timer: float = 0.0

func _ready():
	current_health = max_health

func _process(delta):
	# Handle invulnerability timer
	if is_invulnerable:
		invulnerability_timer -= delta
		if invulnerability_timer <= 0:
			is_invulnerable = false
			_on_invulnerability_ended()

func take_damage(amount: int) -> bool:
	if is_dead or is_invulnerable:
		return false

	var old_health = current_health
	current_health = max(0, current_health - amount)

	health_changed.emit(old_health, current_health)

	if current_health <= 0 and not is_dead:
		die()
		return true

	# Start invulnerability
	is_invulnerable = true
	invulnerability_timer = invulnerability_duration
	_on_damage_taken()

	return true

func heal(amount: int):
	if is_dead:
		return

	var old_health = current_health
	current_health = min(max_health, current_health + amount)

	health_changed.emit(old_health, current_health)

func die():
	if is_dead:
		return

	is_dead = true
	current_health = 0
	died.emit()
	print(get_parent().name, " has died")

func respawn(spawn_position: Vector2 = Vector2.ZERO):
	is_dead = false
	current_health = max_health
	is_invulnerable = true
	invulnerability_timer = invulnerability_duration * 2  # Extra invulnerability on respawn

	if spawn_position != Vector2.ZERO:
		get_parent().global_position = spawn_position

	respawned.emit()
	print(get_parent().name, " has respawned with ", max_health, " HP")

func get_health_percentage() -> float:
	return float(current_health) / float(max_health)

func is_alive() -> bool:
	return not is_dead

# Virtual methods for visual feedback (override in parent entity)
func _on_damage_taken():
	# Visual feedback when taking damage (flash, shake, etc.)
	_flash_entity()

func _on_invulnerability_ended():
	# Reset visual state after invulnerability
	if get_parent().has_node("Sprite") or get_parent().has_node("ColorRect"):
		var visual = get_parent().get_node("Sprite") if get_parent().has_node("Sprite") else get_parent().get_node("ColorRect")
		visual.modulate = Color(1, 1, 1, 1)

func _flash_entity():
	# Flash red when taking damage
	if get_parent().has_node("Sprite") or get_parent().has_node("ColorRect"):
		var visual = get_parent().get_node("Sprite") if get_parent().has_node("Sprite") else get_parent().get_node("ColorRect")
		visual.modulate = Color(1, 0.3, 0.3, 1)

		# Blink during invulnerability
		var tween = create_tween()
		tween.set_loops(int(invulnerability_duration * 4))
		tween.tween_property(visual, "modulate:a", 0.5, 0.125)
		tween.tween_property(visual, "modulate:a", 1.0, 0.125)
