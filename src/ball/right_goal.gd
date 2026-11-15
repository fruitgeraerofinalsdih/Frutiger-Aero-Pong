lextends CharacterBody2D

const SPEED := 1000.0

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	position = Vector2(576, 324)
	var dir_x: float = [-1.0, 1.0].pick_random()
	var dir_y: float = [-1.0, 1.0].pick_random()
	velocity = Vector2(dir_x, dir_y).normalized() * SPEED

func _physics_process(delta: float) -> void:
	var col: KinematicCollision2D = move_and_collide(velocity * delta)
	if col:
		velocity = velocity.bounce(col.get_normal())
