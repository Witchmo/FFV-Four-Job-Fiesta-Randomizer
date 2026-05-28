class_name Job
extends Resource

@export_range(0, 25) var id: int
@export_range(0, 25) var gba_id: int
@export var stats: StatBonuses
@export var sprites: JobSprites
@export var commands: CommandLoadout
@export var weapons: CharacterWeapons
@export var armor: CharacterArmor
