extends CharacterBody2D

class_name Player
@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D
@export var speed = 100.0
@export var jump_impulse = -300.0
@export var gravity := 980.0
