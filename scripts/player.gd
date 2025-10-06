extends RigidBody3D

@export var rolling_force = 20
var fallen : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_update()
	moving_ball(delta)
	falling_check()

func camera_update():
	var old_camera_pos = $CameraPoint.global_transform.origin
	var ball_pos = global_transform.origin
	var new_camera_pos = lerp(old_camera_pos, ball_pos, 0.1)
	$CameraPoint.global_transform.origin = new_camera_pos

func moving_ball(delta):
	if Input.is_action_pressed("up"):
		angular_velocity.x -= rolling_force * delta 
	if Input.is_action_pressed("down"):
		angular_velocity.x += rolling_force * delta
	if Input.is_action_pressed("left"):
		angular_velocity.z += rolling_force * delta
	if Input.is_action_pressed("right"):
		angular_velocity.z -= rolling_force * delta 
	
	#print(linear_velocity)

func falling_check():
	$FallingRayCast.global_position = global_position
	if $FallingRayCast.is_colliding() == false and $FallingTimer.is_stopped():
		$FallingTimer.start()
	if $FallingRayCast.is_colliding() == true:
		$FallingTimer.stop()

func _on_falling_timer_timeout() -> void:
	fallen = true

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if fallen == true:
		var new_transform = state.transform
		new_transform.origin = GameManager.spawnpoint
		state.transform = new_transform
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO
		fallen = false
	
