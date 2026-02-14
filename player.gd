extends CharacterBody2D

# 1. Variables
# @export makes this variable visible in the Inspector (like 'props' in Vue/React)
@export var speed : float = 400.0
@export var friction : float = 20.0
@export var acceleration : float = 40.0

# 2. Physics Loop
# _physics_process is called at a fixed rate (default 60 times/sec). 
# This is where ALL physics movement must happen.
func _physics_process(delta: float) -> void:
	
	# 3. Input Handling
	# get_vector automatically handles the math so diagonal movement isn't faster.
	# It returns a Vector2 between (-1, -1) and (1, 1).
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# 4. Movement Logic
	if direction.length() > 0:
		# Accelerate towards the input direction
		velocity = velocity.move_toward(direction * speed, acceleration)
	else:
		# Decelerate to zero (friction)
		velocity = velocity.move_toward(Vector2.ZERO, friction)

	# 5. The Magic
	# This function uses the 'velocity' variable to move the body.
	# It automatically handles collisions with walls/objects.
	move_and_slide()
