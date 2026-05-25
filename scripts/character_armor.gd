class_name CharacterArmor
extends Resource

@export var bartz: ArmorLoadout
@export var lenna: ArmorLoadout
@export var galuf: ArmorLoadout
@export var faris: ArmorLoadout
@export var krile: ArmorLoadout


func get_loadout(character: CharacterBase.CharacterId) -> ArmorLoadout:
	match character:
		CharacterBase.CharacterId.BARTZ:
			return bartz
			
		CharacterBase.CharacterId.LENNA:
			return lenna
			
		CharacterBase.CharacterId.GALUF:
			return galuf
			
		CharacterBase.CharacterId.FARIS:
			return faris
			
		CharacterBase.CharacterId.KRILE:
			return krile
			
	return null
