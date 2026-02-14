extends CanvasLayer

@onready var score_label: Label = $Label

func _ready() -> void:
	# 1. Initialize the UI with current state
	score_label.text = "Score: " + str(GameManager.score)
	
	# 2. Subscribe to the 'score_updated' signal from the singleton
	# Syntax: Signal.connect(Callable)
	GameManager.score_updated.connect(_on_score_updated)

# This function runs only when the signal fires
func _on_score_updated(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)
