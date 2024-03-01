extends AnimatedSprite2D

var health = 20
var maxHealth = 20
var player
var priorityTarget = true
var cost = 3

func _ready():
	get_node("TextureProgressBar").max_value = maxHealth
	var timer = get_node("Timer")
	timer.one_shot = true
	timer.wait_time = 4
	timer.start()


func _on_timer_timeout():
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
	
func effect():
	pass	
		
func heal(amount) -> void:
	if (health + amount) > maxHealth:
		health =  maxHealth
	else:
		health = health + amount
	get_node("TextureProgressBar").value = health
