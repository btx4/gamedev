extends Node2D

# Variables to control the shake effect
var shake_intensity = 10
var shake_duration = 0.5
var is_shaking = false

# Variables for internal use
var shake_timer = 0
var original_position = Vector2()

func start_shake():
	# Store original position
	original_position = position
	# Set the shake parameters
	shake_intensity = 5
	shake_duration = .3
	shake_timer = .3
	is_shaking = true

func _process(delta):
	if is_shaking:
		shake_timer -= delta
		if shake_timer > 0:
			# Generate random offset within the shake intensity range
			var offset = Vector2(
				randf_range(-shake_intensity, shake_intensity),
				randf_range(-shake_intensity, shake_intensity)
			)
			# Apply offset to position
			position = original_position + offset
		else:
			# Stop shaking and reset position
			is_shaking = false
			position = original_position
