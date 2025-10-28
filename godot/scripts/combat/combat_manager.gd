extends Node
## Combat state machine - handles combat flow and RPS mechanics
## Phase 1 scaffolding - will be expanded in Phase 3

enum CombatState { IDLE, SELECTING_MOVE, RESOLVING, FINISHING }
enum Move { ROCK, PAPER, SCISSORS }

var current_state: CombatState = CombatState.IDLE
var player_move: Move = Move.ROCK
var enemy_move: Move = Move.ROCK

signal combat_started
signal move_selected(move: Move)
signal combat_resolved(player_won: bool)
signal combat_ended

func _ready():
	print("Combat Manager initialized (Phase 1 scaffolding)")

func start_combat(player: Node2D, enemy: Node2D):
	current_state = CombatState.SELECTING_MOVE
	combat_started.emit()
	print("Combat started!")

func select_move(move: Move):
	player_move = move
	move_selected.emit(move)
	print("Player selected: ", Move.keys()[move])

func resolve_combat() -> bool:
	# RPS resolution logic
	if player_move == enemy_move:
		print("TIE!")
		return false  # Tie

	var player_wins = false
	match player_move:
		Move.ROCK:
			player_wins = (enemy_move == Move.SCISSORS)
		Move.PAPER:
			player_wins = (enemy_move == Move.ROCK)
		Move.SCISSORS:
			player_wins = (enemy_move == Move.PAPER)

	combat_resolved.emit(player_wins)
	return player_wins

func end_combat():
	current_state = CombatState.IDLE
	combat_ended.emit()
	print("Combat ended!")

# Placeholder for Phase 3 expansion
func calculate_damage(base_damage: int, is_critical: bool = false) -> int:
	var damage = base_damage
	if is_critical:
		damage = int(damage * 1.5)
	return damage
