class_name JobSelector
extends Node

signal set_run_types(run_types: Array[RunType])
signal set_job_sets(job_sets: Array[JobSet])
signal jobs_selected(jobs: Array[Job])
signal selection_failed

@export var run_types: Array[RunType]
@export var job_sets: Array[JobSet]


func _ready() -> void:
	set_run_types.emit(run_types)
	set_job_sets.emit(job_sets)


func select_random_jobs(run_type_index: int, job_set_index: int, options: RandomizerOptions) -> void:
	var run_type: RunType = run_types[run_type_index]
	var job_set: JobSet = job_sets[job_set_index]
	var selection_context: SelectionContext = SelectionContext.new(run_type, job_set, options)
	var selected_jobs: Array[Job] = job_set.selection_strategy.select_jobs(selection_context)
	
	if selected_jobs.size() < 4:
		selection_failed.emit()
		return
	
	jobs_selected.emit(selected_jobs)


func _on_gui_request_randomization(run_type_index: int, job_set_index: int, options: RandomizerOptions) -> void:
	select_random_jobs(run_type_index, job_set_index, options)
