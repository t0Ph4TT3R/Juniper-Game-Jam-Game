extends Area2D


func _on_body_entered(body):
	if body.has_method("player1"):
		root.player1_won = true
		#print("player1 won")
	elif body.has_method("player2"):
		root.player2_won = true
		#print("player2 won")
