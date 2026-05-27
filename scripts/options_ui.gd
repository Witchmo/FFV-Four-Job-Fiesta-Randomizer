class_name OptionsUI
extends PanelContainer

@onready var is_include_freelancer: CheckBox = %IsIncludeFreelancerCheckBox
@onready var is_allow_duplicates: CheckBox = %IsAllowDuplicatesCheckBox


func get_options() -> RandomizerOptions:
	var options: RandomizerOptions = RandomizerOptions.new()
	
	options.is_include_freelancer = is_include_freelancer.button_pressed
	options.is_allow_duplicates = is_allow_duplicates.button_pressed
	
	return options
