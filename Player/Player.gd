extends CharacterBody2D

var speed = 400.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	move_and_slide()
