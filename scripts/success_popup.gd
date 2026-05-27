class_name SuccessPopup
extends Control

@export var label: Label
var _duration: int
var _current_frames: int = 0


func set_data(text: String, text_color: Color, duration: int) -> void:
	label.text = text
	label.modulate = text_color
	_duration = duration


func _process(delta: float) -> void:
	_current_frames += 1
	
	if _current_frames >= _duration:
		queue_free()
