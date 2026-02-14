extends Node2D

func _ready() -> void:
	# 1. Get all coins currently in the level
	var coins = get_tree().get_nodes_in_group("coins")
	
	# 2. Tell the manager
	GameManager.set_total_coins(coins.size())
