extends Node2D

@export var brick_scene: PackedScene
@export var hard_bricks: PackedScene
@export var slowMoBrick: PackedScene

var offset = 20
var randomNum = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(4):
		offset *= -1;
		for j in range(8):
			randomNum = randi() % 10;
			if(randomNum >=8):
				var new_brick = hard_bricks.instantiate()
				new_brick.position = Vector2(130 * j + 120 + offset, 80 * i + 40 )
				add_child(new_brick)
			elif(randomNum == 7):
				var new_brick = slowMoBrick.instantiate()
				new_brick.position = Vector2(130 * j + 120 + offset, 80 * i + 40 )
				add_child(new_brick)
			else: 
				var new_brick = brick_scene.instantiate()
				new_brick.position = Vector2(130 * j + 120 + offset, 80 * i + 40)
				add_child(new_brick)
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
