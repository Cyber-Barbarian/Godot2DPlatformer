extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	if player.flipped:
		player.animation_player2.play("left_sword_idle")
	elif !player.flipped:
		player.animation_player2.play("right_sword_idle")
	player.animation_player.play("run")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	
	player.move_and_slide()

	if Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)
	if  player.is_on_floor() and Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
