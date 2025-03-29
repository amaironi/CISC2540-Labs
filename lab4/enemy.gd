extends RigidBody3D

var distance = 1.9
var hp = 5
var can_attack_x = false
var can_attack_z = false
var can_attack = true
var win = false
var stop = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area3D.monitoring = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x > $"../CharacterBody3D".position.x + distance and stop == false:
		position.x -= 2*delta
		can_attack_x = false
	elif position.x < $"../CharacterBody3D".position.x - distance and stop == false:
		position.x += 2*delta
		can_attack_x = false
	else:
		can_attack_x = true
	
	if position.z > $"../CharacterBody3D".position.z + distance and stop == false:
		position.z -= 2*delta
		can_attack_z = false
	elif position.z < $"../CharacterBody3D".position.z - distance and stop == false:
		position.z += 2*delta
		can_attack_z = false
	else:
		can_attack_z = true
		
	if can_attack_x == true && can_attack_z == true && can_attack == true && stop == false:
		can_attack = false
		$attack_timer.start()
		$Sword_enemy/AnimationPlayer.play("Swing")
	
	$Label3D.text = "HP: " + str(hp)
	
	if stop == false:
		look_at(Vector3($"../CharacterBody3D".position.x,$"../CharacterBody3D".position.y+1.9,$"../CharacterBody3D".position.z), Vector3(0,1,0), true)
	
	if hp <= 0 && win == false:
		$"../CharacterBody3D/neck/Camera3D/win_text".visible = true
		win = true
		stop = true
		$dead_enemy.play("dead")
		$Label3D.text = "HP: 0"
		
	if hp <= 0:
		$Label3D.text = "HP: 0"
	
	if Input.is_action_just_pressed("Swing"):
		$Area3D.monitoring = true
		$Area3D/Timer.start()


func _on_area_3d_area_entered(area: Area3D) -> void:
	hp -= 1


func _on_timer_timeout() -> void:
	$Area3D.monitoring = false # Replace with function body.


func _on_attack_timer_timeout() -> void:
	if can_attack_x == true && can_attack_z == true:
		$"../CharacterBody3D".hp -= 1
		$"../ColorRect".visible = true
		$"../ColorRect/hit_timer".start()
	can_attack = true
	
func _on_hit_timer_timeout() -> void:
	$"../ColorRect".visible = false # Replace with function body.
