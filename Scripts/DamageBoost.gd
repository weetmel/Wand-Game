class_name DamageBoost
extends Modifier

func on_apply(projectile):
	projectile.damage = projectile.damage * 1.5
	projectile.mesh_material.albedo_color = Color(0.922, 0.251, 0.204, 1)
	projectile.mesh_material.emission = Color(0.922, 0.251, 0.204, 1)
	projectile.hit_effect_material.color = Color(0.922, 0.251, 0.204, 1)
	projectile.hit_effect_material.emission = Color(0.922, 0.251, 0.204, 1)
