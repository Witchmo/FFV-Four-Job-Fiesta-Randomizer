class_name RandomizerUI
extends Control

signal request_randomization(command: RandomizerCommand)
signal request_create_patch

@export var job_spoiler: JobSpoiler
@export var options_select: OptionsUI
@export var create_patch_button: Button
@export var success_popup: PackedScene


func _on_randomize_pressed() -> void:
	request_randomization.emit(options_select.get_randomizer_command())


func _on_allow_duplicates_pressed() -> void:
	options_select.toggle_extra_options_display()


func _on_fiesta_randomizer_jobs_selected(selected_jobs: Array[Job]) -> void:
	job_spoiler.update_spoiler(selected_jobs)
	create_patch_button.disabled = false


func _on_fiesta_randomizer_patch_created() -> void:
	add_child(success_popup.instantiate())


func _on_create_patch_pressed() -> void:
	request_create_patch.emit()


func _on_is_one_job_fiesta_check_box_mouse_entered() -> void:
	pass # Replace with function body.
