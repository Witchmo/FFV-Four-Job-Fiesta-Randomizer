class_name FiestaRandomizer
extends Node

signal patch_created

@export var characters: Array[CharacterBase]
@export var default_file_name: String = "FFV - Four Job Fiesta.ips"
var _selected_jobs: Array[Job]
	

func _create_ips_patch() -> void:
	var ips: IPSGenerator = IPSGenerator.new(characters, _selected_jobs)
	var path: String = await _get_file_path()
	
	if not path:
		return
	
	ips.save_ips_file(path)
	
	patch_created.emit()
	
	
func _get_file_path() -> String:
	var dialog: FileDialog = FileDialog.new()
	
	dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	dialog.access = FileDialog.ACCESS_FILESYSTEM
	dialog.use_native_dialog = true
	dialog.filters = PackedStringArray(["*.ips; IPS file"])
	dialog.current_file = default_file_name
	
	add_child(dialog)
	
	dialog.popup_centered()
	
	var path: String = await dialog.file_selected
	
	dialog.queue_free()
	
	return path


func _on_gui_request_create_patch() -> void:
	_create_ips_patch()


func _on_job_selector_jobs_selected(jobs: Array[Job]) -> void:
	_selected_jobs = jobs
