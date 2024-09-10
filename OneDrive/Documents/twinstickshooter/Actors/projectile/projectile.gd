extends Area2D
var velocity: Vector2 = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func fire(direction: Vector2, speed: float) ->void:
	velocity = direction * speed;
	look_at(velocity)
	print()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += velocity * delta;
	pass


func _on_timer_timeout() -> void:
	queue_free();
	pass # Replace with function body.
