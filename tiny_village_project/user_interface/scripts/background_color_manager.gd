extends Node

var warmth = 0.5  # Range 0-1
var brightness = 0.5  # Range 0-2
const ADJUST_SPEED = 0.02

func _ready():
	update_background()

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		warmth = min(warmth + ADJUST_SPEED, 1.0)
		update_background()
	elif Input.is_action_pressed("ui_left"):
		warmth = max(warmth - ADJUST_SPEED, 0.0)
		update_background()
	elif Input.is_action_pressed("ui_up"):
		brightness = min(brightness + ADJUST_SPEED, 2.0)
		update_background()
	elif Input.is_action_pressed("ui_down"):
		brightness = max(brightness - ADJUST_SPEED, 0.0)
		update_background()

func update_background():
	# Base color (cream/paper-like)
	var r = lerp(0.95, 1.0, brightness)
	var g = lerp(0.92, 0.98, brightness)
	var b = lerp(0.85, 0.95, brightness)
	
	# Adjust warmth
	r = lerp(r, r * 1.1, warmth)
	g = lerp(g, g * 0.95, warmth)
	b = lerp(b, b * 0.8, warmth)
	
	var background_color = Color(r, g, b)
	
	RenderingServer.set_default_clear_color(background_color)
