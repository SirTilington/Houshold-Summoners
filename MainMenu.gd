extends Node2D

var sink = preload("res://Charachters/Objects/Sink/sink.tscn")
var calendar = preload("res://Charachters/Objects/Calender/calendar.tscn")
var coffeMaker = preload("res://Charachters/Objects/CoffeMaker/coffe_maker.tscn")
var couch = preload("res://Charachters/Objects/Couch/couch.tscn")
var hose = preload("res://Charachters/Objects/Hose/hose.tscn")
var iron = preload("res://Charachters/Objects/Iron/iron.tscn")
var shower = preload("res://Charachters/Objects/Shower/shower.tscn")
var brick = preload("res://Charachters/Objects/TheBrick/the_brick.tscn")
var tire = preload("res://Charachters/Objects/Tire/tire.tscn")
var trashcan = preload("res://Charachters/Objects/Trashcan/trashcan.tscn")


var randomSeater = RandomNumberGenerator.new()

func _on_sp_butto_pressed():
	var select = randomSeater.randi_range(1, 4)
	get_tree().change_scene_to_file("res://SelectPlayer1.tscn")
	match select:
		1:
			GameLogic.player2Objects.append(sink.instantiate())
			GameLogic.player2Objects.append(couch.instantiate())
			GameLogic.player2Objects.append(iron.instantiate())
		2:
			GameLogic.player2Objects.append(shower.instantiate())
			GameLogic.player2Objects.append(coffeMaker.instantiate())
			GameLogic.player2Objects.append(brick.instantiate())
		3:
			GameLogic.player2Objects.append(sink.instantiate())
			GameLogic.player2Objects.append(brick.instantiate())
			GameLogic.player2Objects.append(trashcan.instantiate())
		4:
			GameLogic.player2Objects.append(hose.instantiate())
			GameLogic.player2Objects.append(calendar.instantiate())
			GameLogic.player2Objects.append(sink.instantiate())




func _on_mp_button_pressed():
	GameLogic.hotseat = true
	get_tree().change_scene_to_file("res://SelectPlayer1.tscn")
