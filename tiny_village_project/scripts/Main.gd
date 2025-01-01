extends Node

func _ready():
	var tiny_village_scene = load("res://scenes/TinyVillage.tscn")
	var tiny_village = tiny_village_scene.instantiate()
	add_child(tiny_village)
