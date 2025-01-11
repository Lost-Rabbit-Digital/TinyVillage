extends Camera2D

@export var pan_speed: float = 500.0  # Adjust this to control pan speed
@export var pan_margin: float = 100.0  # How close to the edge before panning starts
@export var min_zoom: float = 0.5  # Maximum zoom out (smaller number = more zoomed out)
@export var max_zoom: float = 2.0   # Maximum zoom in
@export var zoom_speed: float = 0.1  # How fast to zoom with scroll wheel
@export var zoom_key_speed: float = 1.0  # How fast to zoom with keys per second

var viewport_size: Vector2
var is_panning: bool = true
var target_zoom: Vector2 = Vector2.ONE  # Target zoom level for smooth zooming

func _ready():
	# Get the initial viewport size
	viewport_size = get_viewport().get_visible_rect().size
	target_zoom = zoom  # Initialize target zoom to match current zoom

func _process(delta):
	handle_panning(delta)
	handle_key_zoom(delta)
	smooth_zoom(delta)

func handle_panning(delta):
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

func handle_key_zoom(delta):
	# Zoom out with Down Arrow
	if Input.is_action_pressed("ui_down"):
		target_zoom = Vector2.ONE * clamp(target_zoom.x - zoom_key_speed * delta, min_zoom, max_zoom)
	# Zoom in with Up Arrow
	if Input.is_action_pressed("ui_up"):
		target_zoom = Vector2.ONE * clamp(target_zoom.x + zoom_key_speed * delta, min_zoom, max_zoom)

func smooth_zoom(delta):
	# Smoothly interpolate current zoom to target zoom
	zoom = zoom.lerp(target_zoom, 10 * delta)

func _input(event):
	# Update viewport size on window resize
	viewport_size = get_viewport().get_visible_rect().size
	
	# Handle mouse wheel zoom
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			# Zoom in with mouse wheel down
			target_zoom = Vector2.ONE * clamp(target_zoom.x - zoom_speed, min_zoom, max_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			# Zoom out with mouse wheel up
			target_zoom = Vector2.ONE * clamp(target_zoom.x + zoom_speed, min_zoom, max_zoom)
	
	if event.is_action_pressed("toggle_pan"):
		is_panning = !is_panning
