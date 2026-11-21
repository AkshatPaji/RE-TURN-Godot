extends CharacterBody2D

const SPEED: float = 300.0
var start_position: Vector2

func _ready() -> void:
	start_position = global_position
	reset_ball()

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var normal: Vector2 = collision.get_normal()
		velocity = velocity.bounce(normal)
		velocity *= 1.05

func reset_ball() -> void:
	global_position = start_position
	var x: float = [-1.0, 1.0].pick_random()
	var y: float
	if randf() < 0.5:
		y = randf_range(-0.5, -0.2)
	else:
		y = randf_range(0.2, 0.5)
	velocity = Vector2(x, y).normalized() * SPEED
