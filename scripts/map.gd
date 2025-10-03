extends Node3D

@export var init_spawnpoint := Vector3(0, 0.5, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Map.rotation = Vector3(0 , deg_to_rad(-45), 0)
	GameManager.spawnpoint = init_spawnpoint
	GameManager.game_started = true
