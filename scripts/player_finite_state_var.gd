extends CharacterBody2D

# State machine example 1
enum States {IDLE, RUNNING, DYING, JUMPING}
@onready var state: States = States.IDLE

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	animated_sprite_2d.flip_h = false
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():		
		velocity += get_gravity() * delta
		state=States.JUMPING
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY	
		state=States.JUMPING
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			state=States.RUNNING
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		state = States.IDLE
	
	if collision_shape_2d.disabled:
		state = States.DYING
	
	# Flip sprite
	if direction>0:
		animated_sprite_2d.flip_h = false
	if direction<0:
		animated_sprite_2d.flip_h = true
	
	set_state(state)
	print(state)
	
	move_and_slide()


func set_state(new_state:int) -> void:
	match state:
		States.IDLE:
			animated_sprite_2d.play("idle")
		States.RUNNING:
			animated_sprite_2d.play("run")
		States.JUMPING:
			animated_sprite_2d.play("jump")
		States.DYING:	
			animated_sprite_2d.play("die")
