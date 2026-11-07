extends Node
## Troca de cenas com transição de fade.

signal scene_changed(path: String)

const FADE_TIME: float = 0.25

var _is_changing: bool = false
var _fade_layer: CanvasLayer
var _fade_rect: ColorRect


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_fade_layer = CanvasLayer.new()
	_fade_layer.layer = 100
	add_child(_fade_layer)
	_fade_rect = ColorRect.new()
	_fade_rect.color = Color.BLACK
	_fade_rect.modulate.a = 0.0
	_fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fade_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	_fade_layer.add_child(_fade_rect)


func change_scene(path: String) -> void:
	if _is_changing:
		return
	if not ResourceLoader.exists(path):
		push_error("SceneManager: cena não encontrada: %s" % path)
		return
	_is_changing = true
	await _fade(1.0)
	get_tree().paused = false
	get_tree().change_scene_to_file(path)
	await get_tree().scene_changed
	scene_changed.emit(path)
	await _fade(0.0)
	_is_changing = false


func reload_current() -> void:
	var current := get_tree().current_scene
	if current:
		change_scene(current.scene_file_path)


func _fade(target_alpha: float) -> void:
	var tween := create_tween()
	tween.tween_property(_fade_rect, "modulate:a", target_alpha, FADE_TIME)
	await tween.finished
