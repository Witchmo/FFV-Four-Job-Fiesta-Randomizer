class_name CharacterButton
extends Button

signal job_changed(job: Job, character: CharacterBase.CharacterId)

@export var job_list: JobList
@export var character: CharacterBase.CharacterId
var _index: int = 21


func _ready() -> void:
	set_sprite(_index)


func set_sprite(index: int) -> void:
	_index = index
	icon = job_list.jobs[index].sprites.get_sprite(character)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_index += 1
			
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_index -= 1
		
		_index = wrapi(_index, 0, job_list.jobs.size())
		set_sprite(_index)
		
		job_changed.emit(job_list.jobs[_index], character)


func _on_mouse_entered() -> void:
	modulate = Color(1.5, 1.5, 1.5)


func _on_mouse_exited() -> void:
	modulate = Color.WHITE
