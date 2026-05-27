class_name DefaultSelection
extends SelectionStrategy


func select_jobs(context: SelectionContext) -> Array[Job]:
	var jobs: Array[Job] = _select_from_crystals(context)
		
	jobs.shuffle()
		
	return jobs
	
	
func _select_from_crystals(context: SelectionContext) -> Array[Job]:
	var jobs: Array[Job] = []
	var attempts: int = 0
	
	while attempts < 1000:
		jobs.clear()
		
		for i in range(4):
			var pool: Array[Job] = context.pool_builder.get_pool_from_crystals(i, 0)
			var valid: Array[Job] = context.rules_validator.get_valid_jobs(pool, jobs)
			
			if valid.size() == 0:
				break
			
			jobs.append(valid.pick_random())
			
		if jobs.size() == 4:
			break
			
		attempts += 1
		
	return jobs
