extends Node3D

@export var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_hit(damage):
	health -= damage
	print(damage)
	if health <= 0:
		queue_free()
