extends Label

func _ready():
	# Access the singleton we created in Step 1
	text = "%s+build.%s" % [Global.version, Global.build_number]
