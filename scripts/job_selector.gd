class_name JobSelector
extends RefCounted

var _crystals: Dictionary[Crystal.Element, Crystal]
var _freelancer: Job
var _party_size: int


func _init(crystals: Dictionary[Crystal.Element, Crystal], freelancer: Job, party_size: int) -> void:
	_crystals = crystals
	_freelancer = freelancer
	_party_size = party_size


func select_random_jobs(command: RandomizerCommand) -> Array[Job]:
	if command.is_use_full_pool:
		return _select_from_all(command)
		
	return _select_unique(command)
	
	
func _select_unique(command: RandomizerCommand) -> Array[Job]:
	var pool: Array[Job] = []
	
	for crystal in _crystals.values():
		pool.append(crystal.jobs.pick_random())
		
	if command.is_include_freelancer:
		pool.append(_freelancer)
		
	pool.shuffle()
	
	var jobs: Array[Job] = []
		
	if command.is_one_job_fiesta:
		jobs.resize(_party_size)
		jobs.fill(pool.pick_random())
		
		return jobs
		
	for i in range(_party_size):
		jobs.append(pool.pop_back())
			
	return jobs


func _select_from_all(command: RandomizerCommand) -> Array[Job]:
	var pool: Array[Job] = _build_pool(command)
	
	if pool.size() < _party_size:
		while pool.size() < _party_size:
			pool.append(_freelancer)
			
	pool.shuffle()
	
	var jobs: Array[Job] = []
	
	if command.is_one_job_fiesta:
		jobs.resize(_party_size)
		jobs.fill(pool[0])
		
		return jobs
	
	if command.is_allow_duplicates:
		for i in range(_party_size):
			jobs.append(pool.pick_random())
			
		return jobs
		
	for i in range(_party_size):
		jobs.append(pool.pop_back())
		
	return jobs


func _build_pool(command: RandomizerCommand) -> Array[Job]:
	var pool: Array[Job] = []
	var flags: Dictionary[Crystal.Element, bool] = {
		Crystal.Element.WIND: command.is_use_wind,
		Crystal.Element.WATER: command.is_use_water,
		Crystal.Element.FIRE: command.is_use_fire,
		Crystal.Element.EARTH: command.is_use_earth,
	}
	
	for key in flags:
		if flags[key]:
			pool.append_array(_crystals[key].jobs)
			
	if command.is_include_freelancer:
		pool.append(_freelancer)
		
	return pool
