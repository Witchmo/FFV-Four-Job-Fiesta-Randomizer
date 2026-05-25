class_name MenuFinger
extends Node2D
## Yes, I know it's a hand. Calling it a finger is funnier.

@export var ui_root: Control


func _ready() -> void:
	_connect_controls(ui_root)


func _connect_controls(node: Node):
	for child in node.get_children():
		
		if child is CheckBox or child is Button:
			child.mouse_entered.connect(
				_on_control_hovered.bind(child)
			)
			
		_connect_controls(child)
		
		
func _on_control_hovered(control: Control):
	global_position = control.global_position + Vector2(-16, 0)
