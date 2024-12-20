extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	#print("jump")
	player.velocity.y = player.jump_impulse
	player.animation_player.play("jump")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	if player.velocity.x>0:
		player.animation_player.flip_h = false
	if player.velocity.x<0:
		player.animation_player.flip_h = true
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if player.velocity.y == 0:
		finished.emit(IDLE)
	#if player.velocity.y >= 0:
	#	finished.emit(FALLING)
