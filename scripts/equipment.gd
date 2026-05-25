class_name Equipment
extends Resource

enum Stats {
	ATK,
	DEF,
	EVA,
	MDEF,
	MEVA,
	WEIGHT
}

@export var id: int
@export var stat_mods: Array[int]
