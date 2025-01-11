extends Camera2D

@export var pan_speed: float = 500.0  # Adjust this to control pan speed
@export var pan_margin: float = 100.0  # How close to the edge before panning starts

var viewport_size: Vector2
var is_panning: bool = true

func _ready():
	# Get the initial viewport size
	viewport_size = get_viewport().get_visible_rect().size

func _process(delta):
	if not is_panning:
		return
		
	var mouse_pos = get_viewport().get_mouse_position()
	var pan_direction = Vector2.ZERO
	
	# Get screen dimensions
	var width = viewport_size.x
	var height = viewport_size.y
	
	# Check which quadrant the mouse is in and set pan direction
	# Quadrant 1 (Top Right)
	if mouse_pos.x > width / 2 and mouse_pos.y < height / 2:
		pan_direction = Vector2(1, -1)
	# Quadrant 2 (Top Left)
	elif mouse_pos.x < width / 2 and mouse_pos.y < height / 2:
		pan_direction = Vector2(-1, -1)
	# Quadrant 3 (Bottom Left)
	elif mouse_pos.x < width / 2 and mouse_pos.y > height / 2:
		pan_direction = Vector2(-1, 1)
	# Quadrant 4 (Bottom Right)
	elif mouse_pos.x > width / 2 and mouse_pos.y > height / 2:
		pan_direction = Vector2(1, 1)
	
	# Apply the pan movement
	if pan_direction != Vector2.ZERO:
		position += pan_direction.normalized() * pan_speed * delta

func _input(event):
	# Update viewport size on window resize
	viewport_size = get_viewport().get_visible_rect().size
	
	# Optional: Toggle panning with spacebar
	if event.is_action_pressed("toggle_pan"):
		is_panning = !is_panning
