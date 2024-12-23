extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	if player.flipped:
		player.animation_player2.play("left_sword_idle")
	elif !player.flipped:
		player.animation_player2.play("right_sword_idle")
	player.velocity.x = 0.0
	player.animation_player.play("idle")
	


func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)
	elif  player.is_on_floor() and Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
