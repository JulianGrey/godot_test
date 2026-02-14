extends Node

signal version_info_updated(full_string)

var version: String = "DEV_BUILD":
	set(value):
		version = value
		_emit_full_version()

var build_number: String = "0":
	set(value):
		build_number = value
		_emit_full_version()

func _emit_full_version():
	var full_version = "%s+build.%s" % [version, build_number]
	version_info_updated.emit(full_version)
