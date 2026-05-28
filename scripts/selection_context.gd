class_name SelectionContext
extends RefCounted

var rules_validator: RulesValidator
var pool_builder: JobPoolBuilder


func _init(run_type: RunType, job_set: JobSet, options: RandomizerOptions) -> void:
	rules_validator = build_rules_validator(options)
	pool_builder = build_job_pool_builder(options, run_type, job_set)
	
	
func build_rules_validator(options: RandomizerOptions) -> RulesValidator:
	var validator: RulesValidator = RulesValidator.new()
	
	if not options.is_allow_duplicates:
		validator.rules.append(NoDuplicatesRule.new())
		
	return validator
	
	
func build_job_pool_builder(options: RandomizerOptions, run_type: RunType, job_set: JobSet) -> JobPoolBuilder:
	var builder: JobPoolBuilder = JobPoolBuilder.new(run_type, job_set)
	
	if options.is_include_freelancer:
		builder.modifiers.append(AddFreelancerModifier.new())
		
	if options.is_berserker_risk:
		builder.modifiers.append(BerserkerRiskModifier.new())
		
	if options.is_include_advance_jobs:
		builder.modifiers.append(AddAdvanceJobs.new())
		
	return builder
