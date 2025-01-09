extends Node

var cloud_textures = []
var screen_width: float
var spawn_timer = 0.0
var cloud_speed = 50.0
const SPAWN_RATE = 3.0
const CLOUD_ALPHA = 0.3
const MAX_ROTATION = 360.0
const MIN_CLOUD_SPEED = 25.0
const MAX_CLOUD_SPEED = 40.0

func _ready():
	screen_width = get_viewport().get_visible_rect().size.x
	for i in range(4):
		var texture = load("assets/cloud_shadows/cloud_shadow_%d.png" % (i + 1))
		cloud_textures.append(texture)

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= SPAWN_RATE:
		spawn_timer = 0
		spawn_cloud()

func spawn_cloud():
	var cloud = TextureRect.new()
	cloud.texture = cloud_textures[randi() % cloud_textures.size()]
	cloud.modulate.a = CLOUD_ALPHA
	cloud.rotation_degrees = randf_range(-MAX_ROTATION, MAX_ROTATION)
	cloud.position.x = -cloud.texture.get_width()
	cloud.position.y = randf_range(0, get_viewport().get_visible_rect().size.y)
	add_child(cloud)
   
	var tween = create_tween()
	cloud_speed = randf_range(MIN_CLOUD_SPEED, MAX_CLOUD_SPEED)
	var duration = (screen_width + cloud.texture.get_width() * 2) / cloud_speed
	tween.tween_property(cloud, "position:x", screen_width, duration)
	tween.tween_callback(cloud.queue_free)
