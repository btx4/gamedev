extends Node2D
# Called when the node enters the scene tree for the first time.
var play = false;
func _ready() -> void:
	if !play:
		$AudioStreamPlayer2D.play()
		play = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
