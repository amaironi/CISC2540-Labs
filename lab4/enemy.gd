extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x > $"../CharacterBody3D".position.x:
		position.x -= 2*delta
	elif position.x == $"../CharacterBody3D".position.x:
		pass
	else:
		position.x += 2*delta
	
	if position.z > $"../CharacterBody3D".position.z:
		position.z -= 2*delta
	elif position.z == $"../CharacterBody3D".position.z:
		pass
	else:
		position.z += 2*delta
