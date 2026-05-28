class_name FiestaRandomizer
extends Node

signal request_create_patch(schema_key: String, jobs: Array[Job])
signal invalid_jobs

@export var freelancer: Job
var _selected_jobs: Array[Job]
	
	
func _ready() -> void:
	_selected_jobs = [freelancer, freelancer, freelancer, freelancer]
	
	
func _is_invalid_job() -> bool:
	for job in _selected_jobs:
		if job.id > freelancer.id:
			return true
	return false


func _on_gui_request_create_patch(schema_key: String) -> void:
	if schema_key == "SUPER FAMICOM" and _is_invalid_job():
		invalid_jobs.emit()
		return
	
	request_create_patch.emit(schema_key, _selected_jobs)


func _on_job_selector_jobs_selected(jobs: Array[Job]) -> void:
	_selected_jobs = jobs


func _on_gui_job_changed(job: Job, character: CharacterBase.CharacterId) -> void:
	_selected_jobs[character] = job
