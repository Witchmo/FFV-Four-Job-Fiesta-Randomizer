class_name OptionsUI
extends PanelContainer

@onready var is_include_freelancer: CheckBox = %IsIncludeFreelancerCheckBox
@onready var is_allow_duplicates: CheckBox = %IsAllowDuplicatesCheckBox
@onready var is_berserker_risk: CheckBox = %IsBerserkerRiskCheckBox
@onready var is_include_advance_jobs: CheckBox = %IncludeAdvanceJobs


func get_options() -> RandomizerOptions:
	var options: RandomizerOptions = RandomizerOptions.new()
	
	options.is_include_freelancer = is_include_freelancer.button_pressed
	options.is_allow_duplicates = is_allow_duplicates.button_pressed
	options.is_berserker_risk = is_berserker_risk.button_pressed
	options.is_include_advance_jobs = is_include_advance_jobs.button_pressed
	
	return options
