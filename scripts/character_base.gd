class_name CharacterBase
extends Resource

enum CharacterId {
	BARTZ,
	LENNA,
	GALUF,
	FARIS,
	KRILE
}

@export var index: CharacterId
@export var level: int
@export var experience: int
@export var hp_mod: int
@export var mp: int
@export var stats: StatBonuses
