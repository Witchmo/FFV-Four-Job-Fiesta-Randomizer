class_name SNESPatchSchema
extends IPSPatchSchema


func serialize_character(character: CharacterData) -> PackedByteArray:
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
	
	w.write_u16_be(w.data.size())
	
	return w.data
