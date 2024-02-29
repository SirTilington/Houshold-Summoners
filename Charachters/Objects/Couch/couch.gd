extends AnimatedSprite2D

var priorityTarget = false
var player
var health = 5
var maxHealth = 5
var target


func _ready():
	get_node("TextureProgressBar").max_value = maxHealth
	var timer = get_node("Timer")
	timer.wait_time = 0.5
	timer.one_shot = true
	timer.start()
	
	
func effect() -> void:
	if player == 1:
		for i in GameLogic.player2Objects:
			if i != null:
				i.get_node("Timer").wait_time = i.get_node("Timer").wait_time + 1
	if player == 2:
		for i in GameLogic.player1Objects:
			if i != null:
				i.get_node("Timer").wait_time = i.get_node("Timer").wait_time + 1
	
func _on_timer_timeout():
	effect()
	get_node("AudioStreamPlayer2D").play()
	play("default")	
	
func takeDamage(amount) -> void:
	health = health - amount
	if health <= 0:
		if player == 1:
			GameLogic.player1Objects.erase(self)
		if player == 2:
			GameLogic.player2Objects.erase(self)
		GameLogic.checkWinner()
		queue_free()
	get_node("TextureProgressBar").value = health
		
func heal(amount) -> void:
	if (health + amount) > maxHealth:
		health =  maxHealth
	else:
		health = health + amount
	get_node("TextureProgressBar").value = health
