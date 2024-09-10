extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var projectile_scene: Resource


func _physics_process(delta: float) -> void:
	look_at(get_viewport().get_mouse_position())
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction2 := Input.get_axis("move_up", "move_down")
	if direction2:
		velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	if Input.is_action_just_pressed("click"):
		on_click_action()

func on_click_action() -> void:
	# Do something when the mouse is clicked
	var new_projectile = projectile_scene.instantiate()
	get_parent().add_child(new_projectile)
	new_projectile.fire(Vector2.from_angle(rotation), 250)
	new_projectile.position = $ProjectileRefPoint.global_position
	# Add your custom logic here
