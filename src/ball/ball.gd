extends CharacterBody2D

const SERVE_SPEED := 500.0
const NORMAL_SPEED := 1000.0

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	position = Vector2(576, 324)
	velocity = Vector2.ZERO
	await get_tree().create_timer(1.0).timeout
	var dir_x: float = [-1.0, 1.0].pick_random()
	var dir_y: float = [-1.0, 1.0].pick_random()
	velocity = Vector2(dir_x, dir_y).normalized() * SERVE_SPEED

func _physics_process(delta: float) -> void:
	var col: KinematicCollision2D = move_and_collide(velocity * delta)
	if col:
		var normal := col.get_normal()
		velocity = velocity.bounce(normal)
		var collider := col.get_collider()
		if collider is CharacterBody2D:
			velocity = velocity.normalized() * NORMAL_SPEED
			$HitSound.play()
		else:
			$WallSound.play()
