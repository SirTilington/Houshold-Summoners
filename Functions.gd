extends Node2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getFanTime() -> float:
	return rng.randf_range(1.1, 1.5)
	
