extends Node
## Ponto de entrada do jogo. Carrega o menu principal.

const FIRST_SCENE: String = "res://scenes/ui/main_menu.tscn"


func _ready() -> void:
	SceneManager.change_scene.call_deferred(FIRST_SCENE)
