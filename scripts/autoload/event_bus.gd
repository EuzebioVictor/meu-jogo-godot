extends Node
## Sinais globais do jogo. Use para comunicação entre sistemas que não se conhecem
## (ex.: HUD reagindo à morte do player). Para pai/filho, prefira sinais locais.

@warning_ignore_start("unused_signal")
signal game_started
signal game_paused(is_paused: bool)
signal player_died
signal level_completed(level_id: StringName)
signal score_changed(new_score: int)
@warning_ignore_restore("unused_signal")
