extends Control

@export var duation_frames: int
var current_frames: int = 0


func _process(delta: float) -> void:
	current_frames += 1
	
	if current_frames >= duation_frames:
		queue_free()
