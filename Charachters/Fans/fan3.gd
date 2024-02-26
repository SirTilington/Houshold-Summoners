extends Sprite2D

var happy = false
var happyFace = preload("res://Charachters/Fans/Fan3Up.png")
var sadFace = preload("res://Charachters/Fans/Fan3Down.png")
var timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	timer.wait_time = Functions.getFanTime()
	timer.start()

func _on_timer_timeout() -> void:
	if happy:
		self.texture = sadFace
		happy = false
	else:
		self.texture = happyFace
		happy = true
	timer.start()
