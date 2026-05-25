class_name JobSpoiler
extends PanelContainer

@export var container: MarginContainer
@export var bartz: TextureRect
@export var lenna: TextureRect
@export var galuf: TextureRect
@export var faris: TextureRect
@export var krile: TextureRect


func update_spoiler(jobs: Array[Job]) -> void:
	var sprites: Array[JobSprites] = _get_job_sprites(jobs)
	_set_sprites(sprites)


func _get_job_sprites(jobs: Array[Job]) -> Array[JobSprites]:
	var sprites: Array[JobSprites] = []
	
	for job in jobs:
		sprites.append(job.sprites)
		
	return sprites


func _set_sprites(sprites: Array[JobSprites]) -> void:
	bartz.texture = sprites[0].bartz
	lenna.texture = sprites[1].lenna
	galuf.texture = sprites[2].galuf
	faris.texture = sprites[3].faris
	krile.texture = sprites[2].krile


func _on_button_pressed() -> void:
	container.visible = not container.visible
