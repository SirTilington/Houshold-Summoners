extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player1Pos = 300
	var player2Pos = 300
	for i in GameLogic.player1Objects:
		i.position = Vector2(280, player1Pos)
		add_child(i)
		player1Pos = player1Pos + 100
	for i in GameLogic.player2Objects:
		i.position = Vector2(1000, player2Pos)
		add_child(i)
		player2Pos = player2Pos + 100
	get_node("AudioStreamPlayer2D").play(15.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
