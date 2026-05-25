extends TextureRect

func _process(delta):
	var focused = get_viewport().gui_get_focus_owner()

	if focused and focused is Control:
		global_position = focused.global_position + Vector2(-16, 0)
