extends CharacterBody2D

@export var speed: float = 200.0
@export var max_speed:float = 5000
@export var min_speed = 100
@export var start_text: RichTextLabel
var forward = Vector2(0, 1).normalized()
var chance = 2
var is_running: bool = false
@export var ball_scene: PackedScene # Reference to the Ball scene

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click_window"):
		visible = true
		is_running = true
		start_text.hide() # Hide the start text when the game starts

func _physics_process(delta: float) -> void:
	if not is_running:
		visible = false
		return # Exit the function if the game hasn't started yet

	var collision: KinematicCollision2D = move_and_collide(forward * speed * delta)
	if collision:
		var collider = collision.get_collider()
		forward = forward.bounce(collision.get_normal())
		speed = clamp(speed + 30, min_speed, max_speed)

		# Check if the collider is the paddle
		if collider.is_in_group("Paddle"):
			$PaddleCollision.play();
			var offset = (collider.position.x - position.x) / 35
			forward.x = -offset
			forward = forward.normalized()

		if collider.is_in_group("Bricks"):
			$BrickCollision.play()
			
			
			if collider.is_in_group("hardBricks"):
				collider.start_shake()
				var sprite = collider.get_node("Sprite2D")  # Access the Sprite2D node
				if sprite.texture == load("res://1x/Asset 1.png"):
					sprite.texture = load("res://1x/Asset 2.png")  # Change the texture path
					
				elif sprite.texture == load("res://1x/Asset 2.png"):
					sprite.texture = load("res://1x/Asset 3.png")
				else:
					spawn_new_ball(position)
					collider.queue_free()
			
			elif (collision.get_collider().is_in_group("SlowMo")):
				collider.queue_free()
				var parent = get_parent()  # Get the parent node
				var child = parent.get_node("SlowMo Handler")  # Find the child node
				if child:
					child._trigger()
				else:
					print("no child node found")
			else:
				if randi() % 11 < chance:
					spawn_new_ball(position)
				collider.queue_free()
			
		if collider.is_in_group("GameOver"):
			print("gameover")
			is_running = false
		
func spawn_new_ball(position: Vector2) -> void:
	var new_ball: Node = duplicate()
	if new_ball:
		new_ball.position = position + Vector2(40, 0)
		new_ball.visible = true;
		new_ball.is_running = true;
		new_ball.speed = 200
		if get_parent():
			get_parent().add_child(new_ball)
			
			# Additional checks
			if not new_ball.is_inside_tree():
				print("New ball is not inside the scene tree.")
		else:
			print("Failed to get parent node.")
	else:
		print("Failed to instantiate new ball.")

#func reset() -> void:
	## Reset the position of the ball
	#position = Vector2(screen_height / 2, screen_height / 2)
	#forward = Vector2(1, 1).normalized()


func _on_slow_mo_timeout() -> void:
	Engine.time_scale = 1
	pass # Replace with function body.
