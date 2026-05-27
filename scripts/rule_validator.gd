class_name RulesValidator
extends RefCounted

var rules: Array[SelectionRule]


func is_valid(job: Job, selected_jobs: Array[Job]) -> bool:
	for rule in rules:
		if not rule.is_valid(job, selected_jobs):
			return false
			
	return true


func get_valid_jobs(pool: Array[Job], selected_jobs: Array[Job]) -> Array[Job]:
	var valid: Array[Job] = []
	
	for job in pool:
		if is_valid(job, selected_jobs):
			valid.append(job)
			
	return valid
