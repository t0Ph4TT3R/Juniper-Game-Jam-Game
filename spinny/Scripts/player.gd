extends CharacterBody2D

const normal_speed = 225.0
const jump_velocity = -1000.0
var double_jump = false

#var direction = 1
var motion = Vector2()

func player1():
	pass


func _physics_process(delta):
	
		# Gets input that can be -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	var speed = normal_speed
	
	# JUMP ---------------------------------------------------------------------------------------
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.6
		if Input.is_action_just_pressed("jump") and double_jump == false:
			double_jump = true
			velocity.y = jump_velocity
	if is_on_floor():
		double_jump = false
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
	#MOVEMENT---------------------------------------------------------------------------------------------	

	if Input.is_action_pressed("move_right"):
		motion.x = speed
		#$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("move_left"):
		motion.x = -speed
		#$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = true
	else:
		motion.x = 0
		#$AnimatedSprite2D.play("Idle")
	
	velocity.x = direction * speed

	move_and_slide()
	#handle_input()
	#update_dash(delta)
