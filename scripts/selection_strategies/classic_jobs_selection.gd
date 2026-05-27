class_name ClassicJobsSelection
extends SelectionStrategy


func select_jobs(context: SelectionContext) -> Array[Job]:
	var jobs: Array[Job] = []
	var pool: Array[Job] = context.pool_builder.get_pool_from_job_set(0)
	
	for i in range(4):
		var valid: Array[Job] = context.rules_validator.get_valid_jobs(pool, jobs)
		
		if valid.is_empty():
			break
			
		jobs.append(valid.pick_random())
		
	jobs.shuffle()
	
	return jobs
