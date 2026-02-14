extends Node

var score: int = 0
var total_coins: int = 0

signal score_updated(new_score: int)

func _ready() -> void:
	# Initialize whenever the game starts/restarts
	start_game()

func start_game() -> void:
	score = 0
	# Queries the scene tree for all nodes in group "coins"
	# Note: This runs BEFORE the coins are ready if called in _ready, 
	# so we might need to call this from the World script instead.
	# Let's keep it simple: We will call this manually from World.gd.
	pass 

func set_total_coins(amount: int) -> void:
	total_coins = amount
	print("Total Coins to Collect: ", total_coins)

func add_score(amount: int = 1) -> void:
	score += amount
	score_updated.emit(score)
	
	# THE WIN CHECK
	if score >= total_coins:
		win_game()

func win_game() -> void:
	print("YOU WIN!")
	# This creates a small delay so the last coin explosion plays
	await get_tree().create_timer(0.5).timeout
	
	# The Router: Swap scenes
	get_tree().change_scene_to_file("res://WinScreen.tscn")
