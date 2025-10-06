extends Node

var spawnpoint := Vector3(0, 0.5, 0)
var game_started := false
var total_game_time := 0.0
var str_total_game_time := "00:00:000"

func _ready() -> void:
	spawnpoint = Vector3(0, 0.5, 0)
	game_started = false
	total_game_time = 0.0

func resetTimer():
	total_game_time = 0.0

func _physics_process(delta: float) -> void:
	if game_started == true:
		total_game_time += delta
		var minutes = int(total_game_time / 60)
		var seconds = int(total_game_time) % 60
		var milliseconds = int((total_game_time - int(total_game_time)) * 1000)
		str_total_game_time = "%02d:%02d:%03d" % [minutes, seconds, milliseconds]
	
	#print(str_total_game_time)
