extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func _trigger() -> void:
	print("Slow Brick Hit")
	Engine.time_scale = 0.1;
	$SlowMo.start(.5)
	$SlowMoSound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
