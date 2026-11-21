extends CharacterBody2D


const SPEED: float = 300.0


func _physics_process(_delta: float) -> void:
	var direction:float= Input.get_axis("up", "down")

	velocity.y = direction * SPEED
	velocity.x = 0.0
	move_and_slide()