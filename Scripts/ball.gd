extends CharacterBody2D

const SPEED: float = 450.0
const SPEED_INCREASE: float = 1.02
const MAX_ANGLE: float = 0.3
const MIN_HORIZONTAL_ANGLE: float = deg_to_rad(80.0)
const MIN_SPEED: float = 440.0
const MAX_SPEED: float = 600.0

var start_position: Vector2


func _ready() -> void:
	start_position = global_position
	reset_ball()


func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()
		var normal: Vector2 = collision.get_normal()

		if collider is CharacterBody2D and collider.name == "Paddle":
			var paddle_velocity: Vector2 = collider.velocity
			var relative_velocity: Vector2 = velocity - paddle_velocity
			var impact_speed: float = relative_velocity.dot(normal)

			if impact_speed < 0.0:
				var restitution: float = 1.0
				relative_velocity -= (
					(1.0 + restitution) * impact_speed * normal
				)

			velocity = relative_velocity + paddle_velocity
		else:
			velocity = velocity.bounce(normal) * SPEED_INCREASE

	if velocity.length_squared() > 0.0:
		var speed: float = velocity.length()
		var horizontal_direction: float = sign(velocity.x)

		if horizontal_direction == 0.0:
			horizontal_direction = 1.0

		var angle: float = atan2(velocity.y, absf(velocity.x))
		angle = clampf(angle, -MIN_HORIZONTAL_ANGLE, MIN_HORIZONTAL_ANGLE)

		velocity = Vector2(
			horizontal_direction * cos(angle),
			sin(angle)
		) * speed

	# Keep speed between 440 and 600.
	var clamped_speed: float = clampf(velocity.length(), MIN_SPEED, MAX_SPEED)
	velocity = velocity.normalized() * clamped_speed


func reset_ball() -> void:
	global_position = start_position

	var x: float = 1.0
	var y: float = randf_range(-MAX_ANGLE, MAX_ANGLE)

	velocity = Vector2(x, y).normalized() * SPEED
