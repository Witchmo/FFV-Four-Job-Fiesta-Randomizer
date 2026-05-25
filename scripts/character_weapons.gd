class_name CharacterWeapons
extends Resource

@export var bartz: WeaponLoadout
@export var lenna: WeaponLoadout
@export var galuf: WeaponLoadout
@export var faris: WeaponLoadout
@export var krile: WeaponLoadout


func get_loadout(character: CharacterBase.CharacterId) -> WeaponLoadout:
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
