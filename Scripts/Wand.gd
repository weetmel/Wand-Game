class_name Wand
extends Node3D

@export var wand_modifiers: Array[Modifier] 
@export var wand_damage_mod = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_modifiers():
	return wand_modifiers
	
func get_damage_mod():
	return wand_damage_mod
