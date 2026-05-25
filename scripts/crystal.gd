class_name Crystal
extends Resource

enum Element {
	WIND,
	WATER,
	FIRE,
	EARTH
}

@export var element: Element
@export var jobs: Array[Job]
