extends Node3D

var checked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and checked == false:
		GameManager.spawnpoint = $Spawnpoint.global_position
		$AudioStreamPlayer.play()
		$Confetti.make_confetti()
		checked = true
