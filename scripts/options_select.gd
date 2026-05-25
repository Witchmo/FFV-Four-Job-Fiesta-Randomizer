class_name OptionsUI
extends PanelContainer

@onready var job_pool: PanelContainer = %JobPool
@onready var is_include_freelancer: CheckBox = %IsIncludeFreelancerCheckBox
@onready var is_one_job_fiesta: CheckBox = %IsOneJobFiestaCheckBox
@onready var is_full_job_pool: CheckBox = %IsFullJobPoolCheckBox
@onready var is_allow_duplicates: CheckBox = %AllowDuplicates
@onready var is_use_wind: CheckBox = %WindCrystalCheckBox
@onready var is_use_water: CheckBox = %WaterCrystalCheckBox
@onready var is_use_fire: CheckBox = %FireCrystalCheckBox
@onready var is_use_earth: CheckBox = %EarthCrystalCheckBox


func _ready() -> void:
	is_one_job_fiesta.grab_focus()


func get_randomizer_command() -> RandomizerCommand:
	var command: RandomizerCommand = RandomizerCommand.new()
	
	command.is_one_job_fiesta = is_one_job_fiesta.button_pressed
	command.is_use_full_pool = is_full_job_pool.button_pressed
	
	if command.is_use_full_pool:
		command.is_use_wind = is_use_wind.button_pressed
		command.is_use_water = is_use_water.button_pressed
		command.is_use_fire = is_use_fire.button_pressed
		command.is_use_earth = is_use_earth.button_pressed
		command.is_include_freelancer = is_include_freelancer.button_pressed
		command.is_allow_duplicates = is_allow_duplicates.button_pressed
	
	return command
	
	
func toggle_extra_options_display() -> void:
	job_pool.visible = not job_pool.visible
	is_allow_duplicates.visible = job_pool.visible
	is_include_freelancer.visible = job_pool.visible
