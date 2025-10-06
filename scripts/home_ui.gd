extends Control

@export var next_scene_path_name := "res://scenes/level_test3.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		await get_tree().create_timer(1.0).timeout
		get_tree().call_deferred("change_scene_to_file", next_scene_path_name)
