class_name CharacterTexture
extends TextureRect

@export var character_id: CharacterBase.CharacterId


func _on_galuf_character_button_job_changed(job: Job, character: CharacterBase.CharacterId) -> void:
	texture = job.sprites.get_sprite(character_id)
