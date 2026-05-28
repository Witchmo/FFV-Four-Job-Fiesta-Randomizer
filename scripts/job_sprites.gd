class_name JobSprites
extends Resource

@export var bartz: CompressedTexture2D
@export var lenna: CompressedTexture2D
@export var galuf: CompressedTexture2D
@export var faris: CompressedTexture2D
@export var krile: CompressedTexture2D
var missing_texture: CompressedTexture2D = preload("res://sprites/missing_texture.png")


func get_sprite(character: CharacterBase.CharacterId) -> CompressedTexture2D:
	match character:
		CharacterBase.CharacterId.BARTZ:
			return bartz if bartz else missing_texture
			
		CharacterBase.CharacterId.LENNA:
			return lenna if lenna else missing_texture
			
		CharacterBase.CharacterId.GALUF:
			return galuf if galuf else missing_texture
			
		CharacterBase.CharacterId.FARIS:
			return faris if faris else missing_texture
			
		CharacterBase.CharacterId.KRILE:
			return krile if krile else missing_texture
			
	return null
