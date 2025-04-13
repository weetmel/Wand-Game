extends Node3D

@export var health = 10
@export var burn_threshold = 3


@onready var mesh = $CharacterBody3D/MeshInstance3D
@onready var mesh_material = mesh.get_active_material(0).duplicate()
@onready var OGmesh_color = mesh.get_active_material(0).albedo_color

var burn_taken = 0
var indicating_hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh.set_surface_override_material(0, mesh_material)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func burn_damage():
	print('burning! ouch!')
	burn_threshold *= 3
	for second in 5:
		await get_tree().create_timer(1.0).timeout
		health -= 1
		hit_indicate(0.1)
		print('post-burn HP: ', health)
		if health <= 0:
			queue_free()

func _on_area_3d_hit(damage, burn):
	if not indicating_hit:
		hit_indicate(0.1)
	health -= damage
	burn_taken += burn
	print('burn taken: ', burn_taken)
	print('damage: ', damage)
	if burn_taken >= burn_threshold:
		burn_damage()
		print('new burn thresh: ', burn_threshold)
	if health <= 0:
		queue_free()

func hit_indicate(time):
	indicating_hit = true
	mesh_material.albedo_color = Color(Color.WHITE)
	await get_tree().create_timer(time).timeout
	mesh_material.albedo_color = OGmesh_color
	indicating_hit = false
