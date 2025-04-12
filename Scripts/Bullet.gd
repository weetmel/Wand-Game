class_name Projectile
extends Node3D

@onready var mesh = $MeshInstance3D
@onready var ray = $RayCast3D
@onready var hit_effect = $"Hit effect"
@onready var mesh_material = mesh.get_active_material(0)
@onready var hit_effect_material = hit_effect.material_override

var modifiers: Array = []
var SPEED = 35
var has_split = false
var lifetime = 0.0
var damage = 2
var pierce = 0
var wand: Wand
var last_collision

func _ready():
	damage = set_damage()
	for modifier in modifiers:
		modifier.on_apply(self)
	print('initial pierce: ', pierce)

func on_hit(target):
	for modifier in modifiers:
		modifier.on_hit(self,target)

func _process(delta):
	lifetime += delta
	position += transform.basis * Vector3(0,0,-SPEED) * delta
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider != last_collision:
			if collider.is_in_group("Enemies"):
				#print('hit enemy')
				last_collision = collider
				ray.get_collider().hitbox_hit(damage)
				pierce -= 1
				#print('post-hit pierce: ', pierce)
				#pierce_down()
				if pierce < 0:
					ray.enabled = false
					kill_self()
			else:
				#print('hit something')
				kill_self()
	if lifetime >= 5:
		kill_self()

func kill_self():
	mesh.visible = false
	hit_effect.emitting = true
	await get_tree().create_timer(1.0).timeout
	queue_free()

func set_wand(w: Wand) -> void:
	wand = w

func set_damage():
	damage += wand.get_damage_mod()
	return damage

#func pierce_down():
	#print('piercing')
	#pierce -= 1

