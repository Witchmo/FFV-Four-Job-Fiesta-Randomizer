class_name AddAdvanceJobs
extends PoolModifier

var _advance_jobs: Array[Job] = [
	preload("res://resources/jobs/22_necromancer.tres"),
	preload("res://resources/jobs/23_oracle.tres"),
	preload("res://resources/jobs/24_cannoneer.tres"),
	preload("res://resources/jobs/25_gladiator.tres")
]

func modify_pool(pool: Array[Job]) -> Array[Job]:
	# To ensure we don't overpopulate the pool with the advance jobs, we only select one at random
	# Otherwise, adding four additional jobs to each pool weighs in favor of the advance jobs to heavily
	# We also add a psuedo-weighted randomness by only adding a job ~50% of the time
	if randi_range(0, 100) > 50:
		return pool 
	
	pool.append(_advance_jobs.pick_random())
		
	return pool
