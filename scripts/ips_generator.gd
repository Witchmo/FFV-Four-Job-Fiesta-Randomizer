class_name IPSGenerator
extends RefCounted

var _rom_offsets: Array[int] = [0x117001, 0x117051, 0x1170A1, 0x1170F1]
var _characters: Array[CharacterBase]
var _jobs: Array[Job]
var _no_job_change_offset: int = 0x2B2A3


func _init(characters: Array[CharacterBase], jobs: Array[Job]) -> void:
	_characters = characters
	_jobs = jobs


func save_ips_file(path: String) -> void:
	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	
	if file == null:
		push_error("Failed to open file: %s" % path)
		return
	
	var bytes: PackedByteArray = _build_ips_patch()
	
	file.store_buffer(bytes)
	
	file.close()


func _build_ips_patch() -> PackedByteArray:
	var w: BinaryWriter = BinaryWriter.new()
	
	for c in "PATCH":
		w.write_u8(c.unicode_at(0))
	
	for i in range(_characters.size()):
		var character_data: CharacterData = CharacterData.new(_characters[i], _jobs[i])
		
		_write_ips_record(w, _rom_offsets[i], _build_character_data(character_data))
		
	_apply_no_job_change(w)
		
	for c in "EOF":
		w.write_u8(c.unicode_at(0))
	
	return w.data


func _write_ips_record(writer: BinaryWriter, offset: int, character_data: PackedByteArray) -> void:
	writer.write_u24_be(offset)
	writer.write_u16_be(character_data.size())
	
	for byte in character_data:
		writer.write_u8(byte)


func _build_character_data(character: CharacterData) -> PackedByteArray:
	var w: BinaryWriter = BinaryWriter.new()
	
	w.write_u8(character.job)
	w.write_u8(character.level)
	
	w.write_u24_le(character.experience)
	
	w.write_u16_le(character.current_hp)
	w.write_u16_le(character.max_hp)
	
	w.write_u16_le(character.current_mp)
	w.write_u16_le(character.max_mp)
	
	w.write_u8(character.helmet)
	w.write_u8(character.armor)
	w.write_u8(character.accessory)
	w.write_u8(0x00)
	
	w.write_u8(character.shield)
	w.write_u8(character.weapon_1)
	w.write_u8(character.weapon_2)
	w.write_u8(0xFF)
	
	w.write_u8(character.command_1)
	w.write_u8(character.command_2)
	w.write_u8(character.command_3)
	w.write_u8(character.command_4)
	
	w.write_padding(0x00, 9)
	
	w.write_u8(character.weight)
	
	w.write_u8(character.strength)
	w.write_u8(character.agility)
	w.write_u8(character.stamina)
	w.write_u8(character.magic)
	
	# Intentional duplication. Not sure why the ROM is like this.
	w.write_u8(character.strength)
	w.write_u8(character.agility)
	w.write_u8(character.stamina)
	w.write_u8(character.magic)
	
	w.write_u8(character.evasion)
	w.write_u8(character.defense)
	w.write_u8(character.magic_evasion)
	w.write_u8(character.magic_defense)
	
	w.write_padding(0x00, 16)
	
	w.write_padding(0xFF, 4)
	
	w.write_u8(character.attack)
	
	return w.data
	
	
func _apply_no_job_change(writer: BinaryWriter) -> void:
	writer.write_u24_be(_no_job_change_offset)
	writer.write_u16_be(0x02)
	writer.write_u16_be(0x80DF)
