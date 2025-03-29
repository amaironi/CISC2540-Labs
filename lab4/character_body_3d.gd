extends CharacterBody3D

@onready var camera_3d = $neck/Camera3D
@onready var neck = $neck
var hp = 5
var loss = false

var SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() && loss == false:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	$"../Label".text = "HEALTH: " + str(hp)
	
	if Input.is_action_just_pressed("Swing") && loss == false:
		$neck/Sword/AnimationPlayer.play("Swing")

	if hp == 0:
		SPEED = 0
		$"../Enemy".stop = true
		$neck/Camera3D/lose_text.visible = true
		loss = true
		hp = -1
		$dead.play("dead")
		
	if hp <= -1:
		$"../Label".text = "HEALTH: 0"
		
	if loss == true && $"../Enemy".win == true:
		$neck/Camera3D/win_text.visible = false
		$neck/Camera3D/lose_text.visible = false
		$neck/Camera3D/draw_text.visible = true
		
		
func _input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if event is InputEventMouseMotion && loss == false:
		camera_3d.rotate_x(-event.relative.y *0.005)
		neck.rotate_y(-event.relative.x*0.005)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, deg_to_rad(-30), deg_to_rad(60))
