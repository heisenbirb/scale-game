extends Node2D
signal finish2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_goal_body_entered(body):
	if body.name == "player":
		self.get_parent().load_next_level()
		
