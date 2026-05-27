class_name AddFreelancerModifier
extends PoolModifier

var _freelancer: Job = preload("res://resources/jobs/21_freelancer.tres")


func modify_pool(pool: Array[Job]) -> Array[Job]:
	if not pool.has(_freelancer):
		pool.append(_freelancer)
		
	return pool
