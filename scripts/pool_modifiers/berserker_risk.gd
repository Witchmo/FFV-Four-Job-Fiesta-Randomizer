class_name BerserkerRiskModifier
extends PoolModifier

var _berserker: Job = preload("res://resources/jobs/06_berserker.tres")


func modify_pool(pool: Array[Job]) -> Array[Job]:
	pool.append(_berserker)
	
	return pool
