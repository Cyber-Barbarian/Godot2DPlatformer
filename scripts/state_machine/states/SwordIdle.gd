extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	if player.flipped == false:
		player.animation_player2.play("right_sword_idle")
	elif player.flipped == true:
		player.animation_player2.play("left_sword_idle")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
