extends Node2D

const SPEED = 60
var direction = 1
@onready var ray_cast_2_ddireita: RayCast2D = $RayCast2Ddireita
@onready var ray_cast_2_desquerda: RayCast2D = $RayCast2Desquerda
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_between_walls(delta)
	
func move_between_walls(delta: float) -> void:
	if ray_cast_2_ddireita.is_colliding() || ray_cast_2_desquerda.is_colliding():
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		direction = -1 * direction
	position.x += direction * SPEED * delta
	
