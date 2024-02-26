extends Node2D

var player1Objects = []
var player2Objects = []
var sink = preload("res://Charachters/Objects/Sink/sink.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	player2Objects.append(sink.instantiate())
	player2Objects.append(sink.instantiate())
	player2Objects.append(sink.instantiate())


func getReady():
	for i in player1Objects:
		i.player = 1
	for i in player2Objects:
		i.player = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func getTargetfromPlayer1() -> Node:
	for i in player1Objects:
		if i.priorityTarget:
			return i
	return player1Objects.pick_random()
	
func getTargetfromPlayer2() -> Node:
	for i in player2Objects:
		if i.priorityTarget:
			return i
	return player2Objects.pick_random()
	
func checkWinner() -> void:
	if player1Objects.is_empty():
		print("Player 2 wins")
	if player2Objects.is_empty():
		print("Player 1 wins")
