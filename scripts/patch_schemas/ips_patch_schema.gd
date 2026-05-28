@abstract
class_name IPSPatchSchema
extends Resource

@export var character_rom_offsets: Array[int]
@export var no_job_change_offset: int
@export var no_job_change_value: int
@export var no_job_change_length: int


func serialize_patch(characters: Array[CharacterBase], jobs: Array[Job]) -> PackedByteArray:
	var w: BinaryWriter = BinaryWriter.new()
	
	for i in range(characters.size()):
		var character_data: CharacterData = CharacterData.new(characters[i], jobs[i])
		var serialized_character: PackedByteArray = serialize_character(character_data)
		
		w.write_u24_be(character_rom_offsets[i])
		w.write_u16_be(serialized_character.size())
		
		w.data.append_array(serialized_character)
		
	w.data.append_array(serialize_no_job_change_patch())
		
	return w.data


@abstract
func serialize_character(character: CharacterData) -> PackedByteArray


func serialize_no_job_change_patch() -> PackedByteArray:
	var w: BinaryWriter = BinaryWriter.new()
	
	w.write_u24_be(no_job_change_offset)
	w.write_u16_be(no_job_change_length)
	w.write_u16_be(no_job_change_value)
	
	return w.data
