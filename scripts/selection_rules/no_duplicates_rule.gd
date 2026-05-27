class_name NoDuplicatesRule
extends SelectionRule


func is_valid(job: Job, selected_jobs: Array[Job]) -> bool:
	return not selected_jobs.has(job)
