class_name IPSGenerator
extends Node

signal patch_created

@export var characters: Array[CharacterBase]
@export var schemas: Dictionary[String, IPSPatchSchema]
@export var default_file_name: String = "FFV - Four Job Fiesta.ips"


func save_ips_file(path: String, schema: IPSPatchSchema, jobs: Array[Job]) -> void:
	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	var w: BinaryWriter = BinaryWriter.new()
	
	for c in "PATCH":
		w.write_u8(c.unicode_at(0))
	
	w.data.append_array(schema.serialize_patch(characters, jobs))
	
	for c in "EOF":
		w.write_u8(c.unicode_at(0))
	
	file.store_buffer(w.data)
	
	file.close()
	
	
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


func _on_fiesta_randomizer_request_create_patch(schema_key: String, jobs: Array[Job]) -> void:
	var path: String = await _get_file_path()
	
	if not path:
		return
	
	if not schemas.has(schema_key):
		push_error("Invalid key for PatchGenerator schemas.")
		return
	
	save_ips_file(path, schemas[schema_key], jobs)
	
	patch_created.emit()
