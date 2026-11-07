extends Control

const GAME_SCENE: String = "res://scenes/levels/level_template.tscn"

@onready var _play_button: Button = %PlayButton
@onready var _quit_button: Button = %QuitButton


func _ready() -> void:
	_play_button.pressed.connect(_on_play_pressed)
	_quit_button.pressed.connect(_on_quit_pressed)
	_quit_button.visible = OS.get_name() != "Web"
	_play_button.grab_focus()


func _on_play_pressed() -> void:
	GameState.reset()
	EventBus.game_started.emit()
	SceneManager.change_scene(GAME_SCENE)


func _on_quit_pressed() -> void:
	get_tree().quit()
