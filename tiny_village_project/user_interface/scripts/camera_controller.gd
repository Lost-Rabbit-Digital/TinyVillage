extends Camera2D

@export var pan_speed: float = 500.0  # Adjust this to control pan speed
@export var horizontal_pan_margin: float = 450.0  # How close to the edge before panning starts
@export var vertical_pan_margin: float = 250.0  # How close to the edge before panning starts
@export var min_zoom: float = 0.5  # Maximum zoom out (smaller number = more zoomed out)
@export var max_zoom: float = 2.0   # Maximum zoom in
@export var zoom_speed: float = 0.1  # How fast to zoom with scroll wheel
@export var zoom_key_speed: float = 1.0  # How fast to zoom with keys per second
@export var debug_outlines: bool = false # Outline of panning margins
@export var camera_zoom: bool = false # Toggle for the zoom mechanic
@export var is_panning: bool = true # Whether or not the camera can pan

var viewport_size: Vector2 # Size of the game window
var target_zoom: Vector2 = Vector2.ONE  # Target zoom level for smooth zooming
var initial_selection_position: Vector2 # Initial point which the selection interaction begins
var final_selection_position: Vector2 # Final point of the selection interaction
var mouse_selection: bool = false # Whether the user is currently selecting something
var mouse_position: Vector2 # The current position of the mouse in the viewport

func _ready():
	# Get the initial viewport size
	viewport_size = get_viewport().get_visible_rect().size
	target_zoom = zoom  # Initialize target zoom to match current zoom

func _process(delta):
	handle_panning(delta)
	handle_key_zoom(delta)
	if camera_zoom:
		smooth_zoom(delta)

func handle_panning(delta):
	if not is_panning:
		return
		
	var mouse_pos = get_viewport().get_mouse_position()
	var pan_direction = Vector2.ZERO
	
	# Check which quadrant the mouse is in and set pan direction
	# Quadrant 1 (Top Right)
	if mouse_pos.x > (viewport_size.x / 2) + horizontal_pan_margin and mouse_pos.y < (viewport_size.y / 2) - vertical_pan_margin:
		pan_direction = Vector2(1, -1)
	# Quadrant 2 (Top Left)
	elif mouse_pos.x < (viewport_size.x / 2) - horizontal_pan_margin and mouse_pos.y < (viewport_size.y / 2) - vertical_pan_margin:
		pan_direction = Vector2(-1, -1)
	# Quadrant 3 (Bottom Left)
	elif mouse_pos.x < (viewport_size.x / 2) - horizontal_pan_margin and mouse_pos.y > (viewport_size.y / 2) + vertical_pan_margin:
		pan_direction = Vector2(-1, 1)
	# Quadrant 4 (Bottom Right)
	elif mouse_pos.x > (viewport_size.x / 2) + horizontal_pan_margin and mouse_pos.y > (viewport_size.y / 2) + vertical_pan_margin:
		pan_direction = Vector2(1, 1)
	# Quadrant 5 (Top)
	elif mouse_pos.y < (viewport_size.y / 2) - vertical_pan_margin:
		pan_direction = Vector2(0, -1)
	# Quadrant 6 (Left)
	elif mouse_pos.x < (viewport_size.x / 2) - horizontal_pan_margin:
		pan_direction = Vector2(-1, 0)
	# Quadrant 7 (Bottom)
	elif mouse_pos.y > (viewport_size.y / 2) + vertical_pan_margin:
		pan_direction = Vector2(0, 1)
	# Quadrant 8 (Right)
	elif mouse_pos.x > (viewport_size.x / 2) + horizontal_pan_margin:
		pan_direction = Vector2(1, 0)
	
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
	
	if event is InputEventMouseButton:
		# Handle mouse selection interaction
		if event.is_action_pressed("interaction"):
			# Begin selection
			mouse_selection = true
			initial_selection_position = event.position
			print("ACTION PRESSED: Mouse selection begin - [STATUS ", mouse_selection, "]")
			print("ACTION LOCATION: ", initial_selection_position)
		elif event.is_action_released("interaction"):
			# End selection
			mouse_selection = false
			final_selection_position = event.position
			print("ACTION PRESSED: Mouse selection finish - [STATUS ", mouse_selection, "]")
			print("ACTION LOCATION: ", final_selection_position)
		
		# Handle mouse wheel zoom
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			# Zoom in with mouse wheel down
			target_zoom = Vector2.ONE * clamp(target_zoom.x - zoom_speed, min_zoom, max_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			# Zoom out with mouse wheel up
			target_zoom = Vector2.ONE * clamp(target_zoom.x + zoom_speed, min_zoom, max_zoom)
	elif event is InputEventMouseMotion:
		mouse_position = event.position
		if mouse_selection:
			queue_redraw()
		#print("Mouse Motion at: ", event.position)

	# Toggle panning mechanic on camera
	if event.is_action_pressed("toggle_pan"):
		is_panning = !is_panning
		print("ACTION PRESSED: Toggle camera pan - [STATUS ", is_panning, "]")
		
	# Toggle visual outlines used for debugging camera pan margins
	if event.is_action_pressed("toggle_debug"):
		debug_outlines = !debug_outlines
		queue_redraw()
		print("ACTION PRESSED: Toggle camera debug outlines - [STATUS ", debug_outlines, "]")

func _draw():
	# Draw the dashed rectangle for the selection interaction
	if mouse_selection:
		var rect_pos = Vector2(
			min(initial_selection_position.x, mouse_position.x),
			min(initial_selection_position.y, mouse_position.y)
		)
		var rect_size = Vector2(
			abs(mouse_position.x - initial_selection_position.x),
			abs(mouse_position.y - initial_selection_position.y)
		)
		
		# Define the four corners
		var top_left = rect_pos
		var top_right = Vector2(rect_pos.x + rect_size.x, rect_pos.y)
		var bottom_right = rect_pos + rect_size
		var bottom_left = Vector2(rect_pos.x, rect_pos.y + rect_size.y)
		
		# Draw the four dashed lines
		draw_dashed_line(top_left, top_right, Color.MEDIUM_AQUAMARINE, 2, 5)  # Top
		draw_dashed_line(top_right, bottom_right, Color.MEDIUM_AQUAMARINE, 2, 5)  # Right
		draw_dashed_line(bottom_right, bottom_left, Color.MEDIUM_AQUAMARINE, 2, 5)  # Bottom
		draw_dashed_line(bottom_left, top_left, Color.MEDIUM_AQUAMARINE, 2, 5)  # Left
	
	# Draw the debug outlines for the pan margins on the camera
	if debug_outlines:
		# Quadrant 1 (Top)
		draw_rect(Rect2(1, 1, viewport_size.x, (viewport_size.y / 2) - vertical_pan_margin), Color.MEDIUM_AQUAMARINE, false, 2)
		# Quadrant 2 (Left)
		draw_rect(Rect2(1, 1, (viewport_size.x / 2) - horizontal_pan_margin, (viewport_size.y / 2) + vertical_pan_margin), Color.YELLOW, false, 2)
		# Quadrant 3 (Bottom)
		draw_rect(Rect2(1, (viewport_size.y / 2) + vertical_pan_margin, viewport_size.x, (viewport_size.y / 2) - vertical_pan_margin), Color.MAROON, false, 2)
		# Quadrant 4 (Right)
		draw_rect(Rect2((viewport_size.x / 2) + horizontal_pan_margin, 1, (viewport_size.x / 2) - horizontal_pan_margin, (viewport_size.y / 2) + vertical_pan_margin), Color.OLIVE_DRAB, false, 2)
		# Quadrant 5 (Top Left)
		draw_rect(Rect2(1, 1, (viewport_size.x / 2) - horizontal_pan_margin, (viewport_size.y / 2) - vertical_pan_margin), Color.WEB_PURPLE, false, 2)
		# Quadrant 6 (Top Right)
		draw_rect(Rect2((viewport_size.x / 2) + horizontal_pan_margin, 1, viewport_size.x, (viewport_size.y / 2) - vertical_pan_margin), Color.ROSY_BROWN, false, 2)
		# Quadrant 7 (Bottom Left)
		draw_rect(Rect2(1, (viewport_size.y / 2) + vertical_pan_margin, (viewport_size.x / 2) - horizontal_pan_margin, viewport_size.y), Color.SANDY_BROWN, false, 2)
		# Quadrant 8 (Bottom Right)
		draw_rect(Rect2((viewport_size.x / 2) + horizontal_pan_margin, (viewport_size.y / 2) + vertical_pan_margin, viewport_size.x, viewport_size.y), Color.GAINSBORO, false, 2)
