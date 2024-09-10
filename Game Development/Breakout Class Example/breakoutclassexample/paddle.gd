extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var y = position.y

func _physics_process(delta: float) -> void:
	# As good practice, you should replace UI actions with custom ga	meplay actions.
	if(position.y != y):
		position.y = y
	position.x = get_viewport().get_mouse_position().x;
	move_and_slide()
