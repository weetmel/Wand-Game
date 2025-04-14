extends Area3D

@export var modifier: Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("Player"):  # Make sure your player is in this group
		if body.has_method("add_modifier"):
			body.add_modifier(modifier)  # Give the player the modifier
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
