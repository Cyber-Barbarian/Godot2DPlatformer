extends CharacterBody2D

class_name Player
@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D
@export var speed = 100.0
@export var jump_impulse = -300.0
@export var gravity := 980.0
@onready var animation_player2: AnimationPlayer = $AnimationPlayer
@export var flipped: bool = false



func _on_left_movement() -> void:
	flipped = true
	animation_player.flip_h = flipped

func _on_right_movement() -> void:
	flipped = false
	animation_player.flip_h = flipped


func _on_attack_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
