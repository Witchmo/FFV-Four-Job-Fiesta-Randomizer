class_name BinaryWriter
extends RefCounted

var data: PackedByteArray = PackedByteArray()


func write_u8(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFF)
	
	data.append(value)
	
	
func write_u16_le(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFFFF)
	
	data.append(value & 0xFF)
	data.append((value >> 8) & 0xFF)
	
	
func write_u16_be(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFFFF)
	
	data.append((value >> 8) & 0xFF)
	data.append(value & 0xFF)
	
	
func write_u24_le(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFFFFFF)
	
	data.append(value & 0xFF)
	data.append((value >> 8) & 0xFF)
	data.append((value >> 16) & 0xFF)
	
	
func write_u24_be(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFFFFFF)
	
	data.append((value >> 16) & 0xFF)
	data.append((value >> 8) & 0xFF)
	data.append(value & 0xFF)
	
	
func write_u32_le(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFFFFFFFF)

	data.append(value & 0xFF)
	data.append((value >> 8) & 0xFF)
	data.append((value >> 16) & 0xFF)
	data.append((value >> 24) & 0xFF)
	
	
func write_u32_be(value: int) -> void:
	assert(value >= 0x00 and value <= 0xFFFFFFFF)
	
	data.append((value >> 24) & 0xFF)
	data.append((value >> 16) & 0xFF)
	data.append((value >> 8) & 0xFF)
	data.append(value & 0xFF)
	
	
func write_padding(value: int, count: int) -> void:
	for i in count:
		write_u8(value)
