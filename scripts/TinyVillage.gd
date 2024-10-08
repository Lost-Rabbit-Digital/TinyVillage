extends Node2D

var tile_width = 96  # Increased from 64
var tile_height = 64  # Increased from 32
var grid_width = 8   # Reduced to compensate for larger tiles
var grid_height = 8  # Reduced to compensate for larger tiles

var current_item = null
var tiles = {}

# Adjusted offset to center the larger grid
var offset_x = 400
var offset_y = 50

func _ready():
	create_grid()
	create_ui()

func create_grid():
	for y in range(grid_height):
		for x in range(grid_width):
			var tile = ColorRect.new()
			tile.color = Color(0.2, 0.2, 0.2, 1)
			tile.size = Vector2(tile_width, tile_height)
			
			# Calculate isometric position
			var iso_x = (x - y) * tile_width / 2 + offset_x
			var iso_y = (x + y) * tile_height / 2 + offset_y
			
			tile.position = Vector2(iso_x, iso_y)
			tile.connect("gui_input", Callable(self, "_on_tile_input").bind(Vector2(x, y)))
			
			add_child(tile)
			tiles[Vector2(x, y)] = tile

func create_ui():
	var ui = HBoxContainer.new()
	ui.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_WIDE)
	ui.position.y += 5
	
	var items = ["House", "Tree", "Road", "Water", "Rock"]
	for item in items:
		var button = Button.new()
		button.text = item
		button.connect("pressed", Callable(self, "_on_item_selected").bind(item))
		ui.add_child(button)
	
	add_child(ui)

func _on_item_selected(item):
	current_item = item

func _on_tile_input(event: InputEvent, grid_pos: Vector2):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if current_item:
			place_item(grid_pos)

func place_item(grid_pos: Vector2):
	print("Placing ", current_item, " at ", grid_pos)
	var tile = tiles.get(grid_pos)
	
	if tile:
		match current_item:
			"House":
				tile.color = Color.RED
			"Tree":
				tile.color = Color.GREEN
			"Road":
				tile.color = Color.GRAY
			"Water":
				tile.color = Color.BLUE
			"Rock":
				tile.color = Color.DARK_GRAY
		# Store the placed item color
		tile.set_meta("placed_color", tile.color)
	else:
		print("Error: Tile not found at position ", grid_pos)

func _input(event):
	if event is InputEventMouseMotion:
		highlight_tile(event.position)

func highlight_tile(mouse_pos: Vector2):
	for tile in tiles.values():
		if tile.has_meta("placed_color"):
			tile.color = tile.get_meta("placed_color")
		else:
			tile.color = Color(0.2, 0.2, 0.2, 1)
	
	var highlighted_tile = get_tile_at_mouse_pos(mouse_pos)
	if highlighted_tile:
		if highlighted_tile.has_meta("placed_color"):
			highlighted_tile.color = highlighted_tile.get_meta("placed_color").lightened(0.2)
		else:
			highlighted_tile.color = Color(0.4, 0.4, 0.4, 1)

func get_tile_at_mouse_pos(mouse_pos: Vector2) -> ColorRect:
	for grid_pos in tiles.keys():
		var tile = tiles[grid_pos]
		if tile.get_global_rect().has_point(mouse_pos):
			return tile
	return null
