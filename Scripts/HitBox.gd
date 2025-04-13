extends Area3D

signal hit(damage, burn)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hitbox_hit(dam, burn):
	emit_signal("hit", dam, burn)
