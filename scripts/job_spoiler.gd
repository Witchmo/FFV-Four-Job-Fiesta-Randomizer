class_name JobSpoiler
extends PanelContainer

signal job_changed(job: Job, character: CharacterBase.CharacterId)

@export var container: MarginContainer
@export var bartz: CharacterButton
@export var lenna: CharacterButton
@export var galuf: CharacterButton
@export var faris: CharacterButton
@export var krile: CharacterTexture


func update_spoiler(jobs: Array[Job]) -> void:
	var ids: Array[int] = _get_job_ids(jobs)
	
	_set_sprites(ids)
	krile.texture = jobs[galuf.character].sprites.get_sprite(krile.character_id)


func _get_job_ids(jobs: Array[Job]) -> Array[int]:
	var ids: Array[int] = []
	
	for job in jobs:
		ids.append(job.id)
		
	return ids


func _set_sprites(ids: Array[int]) -> void:
	bartz.set_sprite(ids[bartz.character])
	lenna.set_sprite(ids[lenna.character])
	galuf.set_sprite(ids[galuf.character])
	faris.set_sprite(ids[faris.character])


func _on_button_pressed() -> void:
	container.visible = not container.visible


func _on_character_button_job_changed(job: Job, character: CharacterBase.CharacterId) -> void:
	job_changed.emit(job, character)
