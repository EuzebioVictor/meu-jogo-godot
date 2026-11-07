extends GutTest


func before_each() -> void:
	GameState.reset()


func after_all() -> void:
	GameState.reset()


func test_add_score() -> void:
	GameState.add_score(10)
	assert_eq(GameState.score, 10)


func test_score_never_negative() -> void:
	GameState.add_score(-50)
	assert_eq(GameState.score, 0)


func test_score_change_emits_event() -> void:
	watch_signals(EventBus)
	GameState.add_score(5)
	assert_signal_emitted_with_parameters(EventBus, "score_changed", [5])


func test_input_actions_exist() -> void:
	for action: StringName in [
		&"move_left", &"move_right", &"move_up", &"move_down", &"jump", &"interact", &"pause"
	]:
		assert_true(InputMap.has_action(action), "Ação ausente no Input Map: %s" % action)
