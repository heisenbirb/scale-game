extends Node
func _on_goal_body_entered(body):
	if body.name == "player" or body.name == "nonscaleableplayer":
		self.get_parent().load_next_level()
