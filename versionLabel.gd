extends Label

func _ready():
	# Initial display
	update_display("%s+build.%s" % [Global.version, Global.build_number])
	
	# Listen for any future updates (like from our CI injection)
	Global.version_info_updated.connect(update_display)

func update_display(new_text):
	text = new_text
