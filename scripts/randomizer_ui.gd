class_name RandomizerUI
extends Control

signal request_randomization(run_type_id: String, job_set_id: String, options: RandomizerOptions)
signal request_create_patch

@export var job_spoiler: JobSpoiler
@export var options_select: OptionsUI
@export var create_patch_button: Button
@export var run_type_button: OptionButton
@export var job_set_button: OptionButton
@export var success_popup: PackedScene


func _on_randomize_pressed() -> void:
	request_randomization.emit(run_type_button.selected, job_set_button.selected, options_select.get_options())


func _on_fiesta_randomizer_patch_created() -> void:
	var popup: SuccessPopup = success_popup.instantiate()
	
	popup.set_data("SUCCESS", Color.GREEN, 60)
	add_child(popup)


func _on_create_patch_pressed() -> void:
	request_create_patch.emit()


func _on_job_selector_set_run_types(run_types: Array[RunType]) -> void:
	for i in range(run_types.size()):
		run_type_button.add_item(run_types[i].id, i)


func _on_job_selector_set_job_sets(job_sets: Array[JobSet]) -> void:
	for i in range(job_sets.size()):
		job_set_button.add_item(job_sets[i].id, i)


func _on_job_selector_jobs_selected(jobs: Array[Job]) -> void:
	job_spoiler.update_spoiler(jobs)
	create_patch_button.disabled = false


func _on_job_selector_selection_failed() -> void:
	var popup: SuccessPopup = success_popup.instantiate()
	
	popup.set_data("SELECTION FAILED. PLEASE TRY AGAIN.", Color.RED, 180)
	add_child(popup)
