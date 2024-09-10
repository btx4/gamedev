extends Node2D

@export var brick_scene: PackedScene
@export var hard_bricks: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(5):
		for j in range(5):
			var new_brick = brick_scene.instantiate()
			new_brick.position = Vector2(50 * i, 50 * j)
			add_child(new_brick)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
