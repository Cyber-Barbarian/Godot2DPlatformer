extends Node2D

@onready var color_shader_sprite_2d: Sprite2D = $OtherShaders/ColorShaderSprite2D

@onready var cpu_particles_2d: CPUParticles2D = $Explosion/CPUParticles2D


var blue_value:float = 1.0
var time:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		cpu_particles_2d.set_deferred("emitting", true)
	time += 0.01
	if time >= 1:
		time = 0
	color_shader_sprite_2d.material.set_shader_parameter("blue_value", time)
