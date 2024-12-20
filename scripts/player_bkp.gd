extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	animated_sprite_2d.flip_h = false
	
func _physics_process(delta: float) -> void:
	print(get_gravity())
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Animações
	if is_on_floor():	
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		if collision_shape_2d.disabled:
			animated_sprite_2d.play("die")
		else:
			animated_sprite_2d.play("jump")
	
	# Flip sprite
	if direction>0:
		animated_sprite_2d.flip_h = false
	if direction<0:
		animated_sprite_2d.flip_h = true
	

	move_and_slide()
