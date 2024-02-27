extends Node2D

var sink = preload("res://Charachters/Objects/Sink/sink.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sp_butto_pressed():
	get_tree().change_scene_to_file("res://SelectPlayer1.tscn")
	GameLogic.player2Objects.append(sink.instantiate())
	GameLogic.player2Objects.append(sink.instantiate())
	GameLogic.player2Objects.append(sink.instantiate())

