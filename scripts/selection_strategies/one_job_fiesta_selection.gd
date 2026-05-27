class_name OneJobFiestaSelection
extends SelectionStrategy


func select_jobs(context: SelectionContext) -> Array[Job]:
	var jobs: Array[Job] = []
	var pool: Array[Job] = context.pool_builder.get_pool_from_job_set(0)
	
	jobs.resize(4)
	jobs.fill(pool.pick_random())
	
	return jobs
