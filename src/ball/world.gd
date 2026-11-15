extends Node2D

var p1_score: int = 0
var p2_score: int = 0

func _on_left_goal_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		p2_score += 1
		$P2Score.text = str(p2_score)
		body.reset_ball()

func _on_right_goal_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		p1_score += 1
		$P1Score.text = str(p1_score)
		body.reset_ball()
