extends CharacterBody2D

signal scaleable_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	get_tree().call_group("player","select_object",self)

func on_powered(power):

	$Sprite2D.apply_scale(Vector2(2,2)) 
	$CollisionShape2D.apply_scale(Vector2(2,2))
