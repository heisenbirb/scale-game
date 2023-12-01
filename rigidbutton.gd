extends RigidBody2D
@export var which_scene_is_getting_powered:String

var activated = false
#TODO: get rid of this monkey code
var firsttime = true
var firsttwotime = true
@export var dofirstpower = true
signal powered

func _ready():
	$AnimatedSprite2D.play("unpressed")

func handle_raycast():
	print("handling raycast")
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	
	var query = PhysicsRayQueryParameters2D.create(Vector2(self.position.x, self.position.y), Vector2(self.position.x, self.position.y+400))
	query.collide_with_bodies = true
	query.exclude=[self]
	#var result = space_state.intersect_ray(query)
	var result = get_world_2d().direct_space_state.intersect_ray(query)
	print(result)
	if result:
		return true
	else:
		return false

func _on_area_2d_body_entered(body):
	if body.name == "player" or body.name == "nonscaleableplayer" or "scaleable_tile" in body.name or "box" in body.name:

		activated = true
		$AnimatedSprite2D.play("pressed")
		firsttime = false
	
		get_tree().call_group(which_scene_is_getting_powered,"on_powered",true)

func _on_area_2d_body_exited(body):
	activated = false
	$AnimatedSprite2D.play("unpressed")
	get_tree().call_group(which_scene_is_getting_powered,"on_powered",false)
