extends Label

func _ready():
	# Access the singleton we created in Step 1
	text = "v" + Global.version
