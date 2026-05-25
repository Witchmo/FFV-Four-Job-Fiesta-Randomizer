extends CheckBox


func _process(delta) -> void:
	if mouse_entered:
		grab_focus()
