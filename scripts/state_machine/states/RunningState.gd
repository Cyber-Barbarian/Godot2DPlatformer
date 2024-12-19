extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("run")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	if player.velocity.x>0:
		player.animation_player.flip_h = false
	if player.velocity.x<0:
		player.animation_player.flip_h = true
	player.move_and_slide()

	#if not player.is_on_floor():
	#	finished.emit(FALLING)
	#elif 
	if  player.is_on_floor() and Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
