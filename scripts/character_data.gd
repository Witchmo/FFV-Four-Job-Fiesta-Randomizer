class_name CharacterData
extends RefCounted

var job: int
var gba_job: int
var level: int
var experience: int
var current_hp: int
var max_hp: int
var current_mp: int
var max_mp: int
var helmet: int
var armor: int
var accessory: int
var shield: int
var weapon_1: int
var weapon_2: int
var weight: int
var command_1: int
var command_2: int
var command_3: int
var command_4: int
var strength: int
var agility: int
var stamina: int
var magic: int
var evasion: int
var defense: int
var magic_evasion: int
var magic_defense: int
var attack: int


func _init(character: CharacterBase, job_data: Job) -> void:
	job = job_data.id
	gba_job = job_data.gba_id
	level = character.level
	experience = character.experience
	
	var armor_loadout: ArmorLoadout = job_data.armor.get_loadout(character.index)
	
	helmet = armor_loadout.head.id
	armor = armor_loadout.body.id
	accessory = armor_loadout.accessory.id
	
	var weapon_loadout: WeaponLoadout = job_data.weapons.get_loadout(character.index)
	
	shield = weapon_loadout.shield.id
	weapon_1 = weapon_loadout.weapon_1.id
	weapon_2 = weapon_loadout.weapon_2.id
	
	weight = _calculate_equipment_stat(armor_loadout, weapon_loadout, Equipment.Stats.WEIGHT)
	
	command_1 = job_data.commands.slot_1.id
	command_2 = job_data.commands.slot_2.id
	command_3 = job_data.commands.slot_3.id
	command_4 = job_data.commands.slot_4.id
	
	strength = character.stats.strength + job_data.stats.strength
	agility = character.stats.agility + job_data.stats.agility
	stamina = character.stats.stamina + job_data.stats.stamina
	magic = character.stats.magic + job_data.stats.magic
	
	defense = _calculate_equipment_stat(armor_loadout, weapon_loadout, Equipment.Stats.DEF)
	evasion = _calculate_equipment_stat(armor_loadout, weapon_loadout, Equipment.Stats.EVA)
	magic_defense = _calculate_equipment_stat(armor_loadout, weapon_loadout, Equipment.Stats.MDEF)
	magic_evasion = _calculate_equipment_stat(armor_loadout, weapon_loadout, Equipment.Stats.MEVA)
	
	current_hp = _calculate_hp(character)
	max_hp = current_hp
	current_mp = character.mp
	max_mp = character.mp
	
	attack = _calculate_equipment_stat(armor_loadout, weapon_loadout, Equipment.Stats.ATK)
	
	
func _calculate_hp(character: CharacterBase) -> int:
	return floor(((stamina + 32) * character.hp_mod) / 32)
	
	
func _calculate_equipment_stat(armor_loadout: ArmorLoadout, weapon_loadout: WeaponLoadout, stat: int) -> int:
	var total: int = 0
	
	total += armor_loadout.head.stat_mods[stat]
	total += armor_loadout.body.stat_mods[stat]
	total += armor_loadout.accessory.stat_mods[stat]
	total += weapon_loadout.shield.stat_mods[stat]
	total += weapon_loadout.weapon_1.stat_mods[stat]
	total += weapon_loadout.weapon_2.stat_mods[stat]
	
	return total
