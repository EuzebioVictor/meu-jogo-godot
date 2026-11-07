extends Node
## Estado da partida atual (pontuação, fase). Zerado por reset().

var score: int = 0:
	set(value):
		score = maxi(value, 0)
		EventBus.score_changed.emit(score)
var current_level: StringName = &""
var is_paused: bool = false


func reset() -> void:
	score = 0
	current_level = &""
	set_paused(false)


func add_score(amount: int) -> void:
	score += amount


func set_paused(value: bool) -> void:
	is_paused = value
	get_tree().paused = value
	EventBus.game_paused.emit(value)
