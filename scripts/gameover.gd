extends Control

@export var next_scene_path_name := "res://scenes/main_menu.tscn"
@export var first_level_path_name := "res://scenes/level_test3.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_started = false
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.stream.set_loop(true)
	$ColorRect/FinishTime.text = GameManager.str_total_game_time
	GameManager.resetTimer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_menu_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", next_scene_path_name)


func _on_new_game_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", first_level_path_name)
