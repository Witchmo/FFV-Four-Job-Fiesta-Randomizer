class_name JobPoolBuilder
extends RefCounted

var modifiers: Array[PoolModifier]
var _run_type: RunType
var _job_set: JobSet 


func _init(run_type: RunType, job_set: JobSet) -> void:
	_run_type = run_type
	_job_set = job_set
	
	
func get_pool_from_crystals(type_index: int, set_index: int) -> Array[Job]:
	var crystals: Array[Crystal] = _run_type.crystals[type_index].crystals
	var pool: Array[Job] = []
	
	for crystal in crystals:
		var filtered: Array[Job] = _filter_jobs(crystal.jobs, set_index)
		
		pool.append_array(filtered)
		
	for modifier in modifiers:
		pool = modifier.modify_pool(pool)
		
	return pool
	
	
func get_pool_from_job_set(set_index: int) -> Array[Job]:
	var pool: Array[Job] = []
	
	for job in _job_set.sets[set_index].jobs:
		pool.append(job)
		
	for modifier in modifiers:
		pool = modifier.modify_pool(pool)
		
	return pool
	
	
func _filter_jobs(pool: Array[Job], set_index: int) -> Array[Job]:
	var filtered_pool: Array[Job] = []
	
	for job in pool:
		if job in _job_set.sets[set_index].jobs:
			filtered_pool.append(job)
			
	return filtered_pool
