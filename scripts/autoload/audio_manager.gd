extends Node
## Música (com troca suave) e efeitos sonoros nos buses "Music" e "SFX".

const SFX_POOL_SIZE: int = 8

var _music_player: AudioStreamPlayer
var _sfx_players: Array[AudioStreamPlayer] = []


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_music_player = AudioStreamPlayer.new()
	_music_player.bus = &"Music"
	add_child(_music_player)
	for i in SFX_POOL_SIZE:
		var player := AudioStreamPlayer.new()
		player.bus = &"SFX"
		add_child(player)
		_sfx_players.append(player)


func play_music(stream: AudioStream, fade_time: float = 0.5) -> void:
	if _music_player.stream == stream and _music_player.playing:
		return
	if _music_player.playing:
		var out := create_tween()
		out.tween_property(_music_player, "volume_db", -40.0, fade_time)
		await out.finished
	_music_player.stream = stream
	_music_player.volume_db = -40.0
	_music_player.play()
	create_tween().tween_property(_music_player, "volume_db", 0.0, fade_time)


func stop_music() -> void:
	_music_player.stop()


func play_sfx(stream: AudioStream, pitch_variation: float = 0.0) -> void:
	for player in _sfx_players:
		if not player.playing:
			player.stream = stream
			player.pitch_scale = 1.0 + randf_range(-pitch_variation, pitch_variation)
			player.play()
			return


## volume_linear de 0.0 a 1.0.
func set_bus_volume(bus_name: StringName, volume_linear: float) -> void:
	var index := AudioServer.get_bus_index(bus_name)
	if index == -1:
		push_warning("AudioManager: bus inexistente: %s" % bus_name)
		return
	AudioServer.set_bus_volume_db(index, linear_to_db(clampf(volume_linear, 0.0, 1.0)))
