extends Sprite2D

var priorityTarget = false
var player
var health = 3
var maxHealth = 3
var target
var cost = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	get_node("TextureProgressBar").max_value = maxHealth
func effect() -> void:
	pass
	
func _on_timer_timeout():
	effect()
	get_node("AudioStreamPlayer2D").play()
	
func takeDamage(amount) -> void:
	health = health - amount
	if health <= 0:
		if player == 1:
			GameLogic.player1Objects.erase(self)
		if player == 2:
			GameLogic.player2Objects.erase(self)
		GameLogic.checkWinner()
		get_node("AudioStreamPlayer2D").play()
		if player == 1:
			for i in GameLogic.player2Objects:
				if i != null:
					i.takeDamage(3)
		if player == 2:
			for i in GameLogic.player1Objects:
				if i != null:
					i.takeDamage(3)
		queue_free()
	get_node("TextureProgressBar").value = health
	
func heal(amount) -> void:
	if (health + amount) > maxHealth:
		health =  maxHealth
	else:
		health = health + amount
	get_node("TextureProgressBar").value = health
