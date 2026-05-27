class_name Team375Selection
extends SelectionStrategy


func select_jobs(context: SelectionContext) -> Array[Job]:
	var jobs: Array[Job] = []
	
	for i in range(2):
		var pool: Array[Job] = context.pool_builder.get_pool_from_job_set(0)
		var valid: Array[Job] = context.rules_validator.get_valid_jobs(pool, jobs)
		
		if valid.is_empty():
			break
			
		jobs.append(valid.pick_random())
		
	for i in range(2):
		var pool: Array[Job] = context.pool_builder.get_pool_from_job_set(1)
		var valid: Array[Job] = context.rules_validator.get_valid_jobs(pool, jobs)
		
		if valid.is_empty():
			break
			
		jobs.append(valid.pick_random())
		
	jobs.shuffle()
		
	return jobs
