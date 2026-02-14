extends Area2D

# Get references to the visual parts
@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var particles = $CPUParticles2D

func _on_body_entered(body: Node2D) -> void:
	GameManager.add_score(1)
	
	# 1. Disable the coin so it can't be picked up twice
	collision.set_deferred("disabled", true)
	
	# 2. Hide the sprite (make it look like it's gone)
	sprite.hide()
	
	# 3. Trigger the explosion
	particles.emitting = true
	
	# 4. Wait for the particles to finish (approx 1 second)
	await get_tree().create_timer(1.0).timeout
	
	# 5. NOW delete the object
	queue_free()
	
