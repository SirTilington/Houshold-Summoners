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

func _ready():
	redFrame.texture = redFramePNG
	redFrame.position = Vector2(16, 16)

func _on_sink_button_pressed():
	if sinkSelected:
		refundPoints(1)
		sinkSelected = false
		GameLogic.player1Objects.erase(sink)
		for i in get_node("SinkButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 1:
			spendPoints(1)
			sinkSelected = true
			GameLogic.player1Objects.append(sink)
			get_node("SinkButton").add_child(redFrame.duplicate())
			
func _on_hose_pressed():
	if hoseSelected:
		refundPoints(2)
		hoseSelected = false
		GameLogic.player1Objects.erase(hose)
		for i in get_node("Hose").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 2:
			spendPoints(2)
			hoseSelected = true
			GameLogic.player1Objects.append(hose)
			get_node("Hose").add_child(redFrame.duplicate())

func _on_calendar_button_pressed():
	if calendarSelected:
		refundPoints(3)
		calendarSelected = false
		GameLogic.player1Objects.erase(calendar)
		for i in get_node("CalendarButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			calendarSelected = true
			GameLogic.player1Objects.append(calendar)
			get_node("CalendarButton").add_child(redFrame.duplicate())

func _on_texture_button_pressed():
	if tireSelected:
		refundPoints(3)
		tireSelected = false
		GameLogic.player1Objects.erase(tire)
		for i in get_node("TextureButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			tireSelected = true
			GameLogic.player1Objects.append(tire)
			get_node("TextureButton").add_child(redFrame.duplicate())
	
func _on_iron_button_pressed():
	if ironSelected:
		refundPoints(2)
		ironSelected = false
		GameLogic.player1Objects.erase(iron)
		for i in get_node("IronButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 2:
			spendPoints(2)
			ironSelected = true
			GameLogic.player1Objects.append(iron)
			get_node("IronButton").add_child(redFrame.duplicate())

func _on_coffe_maker_button_pressed():
	if coffeMakerSelected:
		refundPoints(3)
		coffeMakerSelected = false
		GameLogic.player1Objects.erase(coffeMaker)
		for i in get_node("CoffeMakerButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			coffeMakerSelected = true
			GameLogic.player1Objects.append(coffeMaker)
			get_node("CoffeMakerButton").add_child(redFrame.duplicate())
			

func _on_shower_button_pressed():
	if showerSelected:
		refundPoints(5)
		showerSelected = false
		GameLogic.player1Objects.erase(shower)
		for i in get_node("ShowerButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 5:
			spendPoints(5)
			showerSelected = true
			GameLogic.player1Objects.append(shower)
			get_node("ShowerButton").add_child(redFrame.duplicate())
			
func _on_couch_pressed():
	if couchSelected:
		refundPoints(3)
		couchSelected = false
		GameLogic.player1Objects.erase(couch)
		for i in get_node("Couch").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			couchSelected = true
			GameLogic.player1Objects.append(couch)
			get_node("Couch").add_child(redFrame.duplicate())
	
func _on_brick_button_pressed():
	if brickSelected:
		refundPoints(3)
		brickSelected = false
		GameLogic.player1Objects.erase(brick)
		for i in get_node("BrickButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			brickSelected = true
			GameLogic.player1Objects.append(brick)
			get_node("BrickButton").add_child(redFrame.duplicate())

func spendPoints(amount) -> void:
	pointsSpend = pointsSpend + amount
	get_node("pointsSpendLabel").text = "Points Spend: " + str(pointsSpend) + "/10"
	get_node("ProgressBar").value = pointsSpend
	
func refundPoints(amount) -> void:
	pointsSpend = pointsSpend - amount
	get_node("pointsSpendLabel").text = "Points Spend: " + str(pointsSpend) + "/10"
	get_node("ProgressBar").value = pointsSpend
	

func _on_start_button_pressed():
	GameLogic.getReady()
	get_tree().change_scene_to_file("res://main.tscn")









