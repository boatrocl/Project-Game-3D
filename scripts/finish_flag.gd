extends Node3D

@export var next_scene_path_name : String = "res://scenes/level_test.tscn"
var finished : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and finished == false:
		finished = true
		print("finish")
		await get_tree().create_timer(1.0).timeout
		get_tree().call_deferred("change_scene_to_file", next_scene_path_name)
