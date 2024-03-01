extends AnimatedSprite2D


var priorityTarget = false
var player
var health = 7
var maxHealth = 7
var cost = 3
var target


func _ready():
	get_node("TextureProgressBar").max_value = maxHealth
	var timer = get_node("Timer")
	timer.wait_time = 2
	timer.start()
	
	
func effect() -> void:
	if player == 1:
		GameLogic.player1Objects.pick_random()
	if player == 2:
		GameLogic.player2Objects.pick_random()
	if target != null:
			await get_tree().create_timer(0.1).timeout
			target.effect()

	
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
	
