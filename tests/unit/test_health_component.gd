extends GutTest

var _health: HealthComponent


func before_each() -> void:
	_health = HealthComponent.new()
	_health.max_health = 5
	add_child_autofree(_health)


func test_starts_at_max_health() -> void:
	assert_eq(_health.current_health, 5)


func test_take_damage_reduces_health() -> void:
	_health.take_damage(2)
	assert_eq(_health.current_health, 3)


func test_health_never_goes_below_zero() -> void:
	_health.take_damage(99)
	assert_eq(_health.current_health, 0)


func test_died_emitted_once() -> void:
	watch_signals(_health)
	_health.take_damage(5)
	_health.take_damage(1)
	assert_signal_emit_count(_health, "died", 1)


func test_heal_is_capped_at_max() -> void:
	_health.take_damage(3)
	_health.heal(10)
	assert_eq(_health.current_health, 5)


func test_cannot_heal_when_dead() -> void:
	_health.take_damage(5)
	_health.heal(2)
	assert_true(_health.is_dead())
