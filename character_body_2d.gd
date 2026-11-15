extends CharacterBody2D

const SPEED := 900.0
@onready var start_x: float = position.x

func _physics_process(delta: float) -> void:
	var direction := 0.0
	if Input.is_key_pressed(KEY_UP):
		direction -= 1.0
	if Input.is_key_pressed(KEY_DOWN):
		direction += 1.0

	velocity.y = direction * SPEED
	velocity.x = 0.0
	move_and_slide()
	position.x = start_x
