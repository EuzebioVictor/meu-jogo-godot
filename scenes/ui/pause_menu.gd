extends CanvasLayer
## Menu de pausa. Instancie dentro de qualquer fase.

const MENU_SCENE: String = "res://scenes/ui/main_menu.tscn"

@onready var _resume_button: Button = %ResumeButton
@onready var _menu_button: Button = %MenuButton


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	_resume_button.pressed.connect(_toggle)
	_menu_button.pressed.connect(_on_menu_pressed)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_toggle()
		get_viewport().set_input_as_handled()


func _toggle() -> void:
	var paused := not GameState.is_paused
	GameState.set_paused(paused)
	visible = paused
	if paused:
		_resume_button.grab_focus()


func _on_menu_pressed() -> void:
	GameState.set_paused(false)
	SceneManager.change_scene(MENU_SCENE)
