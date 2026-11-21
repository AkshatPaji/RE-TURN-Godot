extends CharacterBody2D

const SPEED: float = 450.0
const MAX_POSITION_TILT: float = deg_to_rad(90.0)
const MAX_MOVEMENT_TILT: float = deg_to_rad(15.0)
const TILT_SPEED: float = deg_to_rad(180.0)
const TOP_WALL_Y: float = 69.0
const BOTTOM_WALL_Y: float = 655.0
const PADDLE_MARGIN: float = 55.0


func _physics_process(delta: float) -> void:
	var direction: float = Input.get_axis("up", "down")

	velocity.y = direction * SPEED
	velocity.x = 0.0
	move_and_slide()
	position.y = clampf(
		position.y,
		TOP_WALL_Y + PADDLE_MARGIN,
		BOTTOM_WALL_Y - PADDLE_MARGIN
	)
	if position.y == TOP_WALL_Y + PADDLE_MARGIN or position.y == BOTTOM_WALL_Y - PADDLE_MARGIN:
		velocity.y = 0.0

	var position_ratio: float = inverse_lerp(
		TOP_WALL_Y + PADDLE_MARGIN,
		BOTTOM_WALL_Y - PADDLE_MARGIN,
		position.y
	)
	position_ratio = clampf(position_ratio, 0.0, 1.0)

	var position_tilt: float = lerpf(
		0.0,
		deg_to_rad(90.0),
		position_ratio
	)

	var movement_tilt: float = direction * MAX_MOVEMENT_TILT
	var target_rotation: float = clampf(
		position_tilt + movement_tilt,
		-MAX_MOVEMENT_TILT,
		MAX_POSITION_TILT + MAX_MOVEMENT_TILT
	)

	rotation = move_toward(rotation, target_rotation, TILT_SPEED * delta)
