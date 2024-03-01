extends Node2D

var pointsSpend = 0
var pointsMax = 10

var redFrame = Sprite2D.new()
var redFramePNG = preload("res://selectFrame.png")

var sink = preload("res://Charachters/Objects/Sink/sink.tscn").instantiate()
var sinkSelected = false
var calendar = preload("res://Charachters/Objects/Calender/calendar.tscn").instantiate()
var calendarSelected = false
var tire = preload("res://Charachters/Objects/Tire/tire.tscn").instantiate()
var tireSelected = false
var iron = preload("res://Charachters/Objects/Iron/iron.tscn").instantiate()
var ironSelected = false
var coffeMaker = preload("res://Charachters/Objects/CoffeMaker/coffe_maker.tscn").instantiate()
var coffeMakerSelected = false
var shower = preload("res://Charachters/Objects/Shower/shower.tscn").instantiate()
var showerSelected = false
var couch = preload("res://Charachters/Objects/Couch/couch.tscn").instantiate()
var couchSelected = false
var brick = preload("res://Charachters/Objects/TheBrick/the_brick.tscn").instantiate()
var brickSelected = false
var hose = preload("res://Charachters/Objects/Hose/hose.tscn").instantiate()
var hoseSelected =  false
var trashCan = preload("res://Charachters/Objects/Trashcan/trashcan.tscn").instantiate()
var trashCanSelected = false

func _ready():
	redFrame.texture = redFramePNG
	redFrame.position = Vector2(16, 16)
	if GameLogic.player1Finished:
		get_node("PlayerLabels").text = "Player 2"

func _on_sink_button_pressed():
	if sinkSelected:
		removeFromGame(sink)
		sinkSelected = false
		get_node("SinkButton").get_child(0).queue_free()

	else:
		if addToGame(sink):
			sinkSelected = true
			get_node("SinkButton").add_child(redFrame.duplicate())
			
func _on_hose_pressed():
	if hoseSelected:
		removeFromGame(hose)
		hoseSelected = false
		get_node("Hose").get_child(0).queue_free()
	else:
		if addToGame(hose):
			hoseSelected = true
			get_node("Hose").add_child(redFrame.duplicate())

func _on_calendar_button_pressed():
	if calendarSelected:
		removeFromGame(calendar)
		calendarSelected = false
		get_node("CalendarButton").get_child(0).queue_free()
	else:
		if addToGame(calendar):
			calendarSelected = true
			get_node("CalendarButton").add_child(redFrame.duplicate())

func _on_texture_button_pressed():
	if tireSelected:
		removeFromGame(tire)
		tireSelected = false
		get_node("TextureButton").get_child(0).queue_free()
	else:
		if addToGame(tire):
			tireSelected = true
			get_node("TextureButton").add_child(redFrame.duplicate())
	
func _on_iron_button_pressed():
	if ironSelected:
		removeFromGame(iron)
		ironSelected = false
		get_node("IronButton").get_child(0).queue_free()
	else:
		if addToGame(iron):
			ironSelected = true
			get_node("IronButton").add_child(redFrame.duplicate())

func _on_coffe_maker_button_pressed():
	if coffeMakerSelected:
		removeFromGame(coffeMaker)
		coffeMakerSelected = false
		get_node("CoffeMakerButton").get_child(0).queue_free()
	else:
		if addToGame(coffeMaker):
			coffeMakerSelected = true
			get_node("CoffeMakerButton").add_child(redFrame.duplicate())

func _on_shower_button_pressed():
	if showerSelected:
		removeFromGame(shower)
		showerSelected = false
		get_node("ShowerButton").get_child(0).queue_free()
	else:
		if addToGame(shower):
			showerSelected = true
			get_node("ShowerButton").add_child(redFrame.duplicate())
			
func _on_couch_pressed():
	if couchSelected:
		removeFromGame(couch)
		couchSelected = false
		get_node("Couch").get_child(0).queue_free()
	else:
		if addToGame(couch):
			couchSelected = true
			get_node("Couch").add_child(redFrame.duplicate())
	
func _on_brick_button_pressed():
	if brickSelected:
		removeFromGame(brick)
		brickSelected = false
		get_node("BrickButton").get_child(0).queue_free()
	else:
		if addToGame(brick):
			brickSelected = true
			get_node("BrickButton").add_child(redFrame.duplicate())

func _on_trashcan_button_pressed():
	if trashCanSelected:
		removeFromGame(trashCan)
		trashCanSelected = true
		get_node("TrashcanButton").get_child(0).queue_free()
	else:
		if addToGame(trashCan):
			trashCanSelected = true
			get_node("TrashcanButton").add_child(redFrame.duplicate())
			
func spendPoints(amount) -> void:
	pointsSpend = pointsSpend + amount
	get_node("pointsSpendLabel").text = "Points Spend: " + str(pointsSpend) + "/10"
	get_node("ProgressBar").value = pointsSpend
	
func refundPoints(amount) -> void:
	pointsSpend = pointsSpend - amount
	get_node("pointsSpendLabel").text = "Points Spend: " + str(pointsSpend) + "/10"
	get_node("ProgressBar").value = pointsSpend
	

func addToGame(node) -> bool:
	if pointsMax - pointsSpend >= node.cost:
		if GameLogic.player1Finished:
			GameLogic.player2Objects.append(node)
			spendPoints(node.cost)
			return true
		else:
			GameLogic.player1Objects.append(node)
			spendPoints(node.cost)
			return true
	else:
		return false
		
func removeFromGame(node) -> void:
	if GameLogic.player1Finished:
		GameLogic.player2Objects.erase(node)
		refundPoints(node.cost)
	else:
		GameLogic.player1Objects.erase(node)
		refundPoints(node.cost)

func _on_start_button_pressed():
	if GameLogic.hotseat:
		if GameLogic.player1Finished:
			GameLogic.getReady()
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			GameLogic.player1Finished = true
			get_tree().reload_current_scene()
	else:
		GameLogic.getReady()
		get_tree().change_scene_to_file("res://main.tscn")
	












