extends CharacterBody2D

const SPEED: float = 470.0
const MIN_SPEED: float = 440.0
const MAX_SPEED: float = 600.0
const MAX_BOUNCE_ANGLE: float = deg_to_rad(60.0)
var start_position: Vector2

func _ready() -> void:
	start_position = global_position
	reset_ball()

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var normal: Vector2 = collision.get_normal()
		var collider: Object = collision.get_collider()

		if collider is CharacterBody2D and collider.name == "Paddle":
			var paddle: CharacterBody2D = collider as CharacterBody2D
			var hit_position: Vector2 = collision.get_position()
			var local_hit: Vector2 = paddle.to_local(hit_position)
			var hit_offset: float = clampf(local_hit.y / 87.0, -1.0, 1.0)
			var bounce_angle: float = hit_offset * MAX_BOUNCE_ANGLE
			var paddle_influence: float = clampf(
				paddle.velocity.y / SPEED,
				-1.0,
				1.0
			) * deg_to_rad(8.0)
			bounce_angle = clampf(
				bounce_angle + paddle_influence,
				-MAX_BOUNCE_ANGLE,
				MAX_BOUNCE_ANGLE
			)

			var horizontal_direction: float = sign(
				global_position.x - paddle.global_position.x
			)
			if horizontal_direction == 0.0:
				horizontal_direction = sign(velocity.x)
			velocity = Vector2(
				horizontal_direction * cos(bounce_angle),
				sin(bounce_angle)
			)
		else:
			velocity = velocity.bounce(normal)

		var new_speed: float = clampf(
			velocity.length() * randf_range(0.95, 1.05),
			MIN_SPEED,
			MAX_SPEED
		)
		velocity = velocity.normalized() * new_speed

func reset_ball() -> void:
	global_position = start_position
	var x: float = [-0.1, 1.0].pick_random()
	var y: float
	if randf() < 0.5:
		y = randf_range(-0.6, -0.25)
	else:
		y = randf_range(0.25, 0.6)
	velocity = Vector2(x, y).normalized() * SPEED
