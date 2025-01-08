extends TextureRect

var animation = {
	"timer": 0.0,
	"rate": 0.70,
	"current_frame": 0,
	"frames": []
}

func _ready():
	# Load the textures
	for i in range(4):
		var texture = load("assets/window_borders/window_border_%d.png" % (i + 1))
		animation.frames.append(texture)
	
	texture = animation.frames[0]

func _process(delta):
	animation.timer += delta
	if animation.timer > animation.rate:
		animation.timer = 0
		set_new_frame()

func set_new_frame():
	animation.current_frame = (animation.current_frame + 1) % animation.frames.size()
	texture = animation.frames[animation.current_frame]
