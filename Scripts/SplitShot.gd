class_name SplitShot
extends Modifier

func on_apply(projectile):
	# recursion protection
	if projectile.has_split == false:
		projectile.has_split = true
		projectile.damage *= 0.6
		for i in range(2):
			var new_projectile = projectile.duplicate()
			# Apply rotation around Y-axis (yaw) in 3D
			new_projectile.rotation.y += deg_to_rad(10 * (i - 0.5))  # Left, center, right
			new_projectile.damage *= 0.6
			new_projectile.modifiers = projectile.modifiers
			new_projectile.wand = projectile.wand
			new_projectile.has_split = true
			# Add the new projectile to the parent
			projectile.get_parent().add_child(new_projectile)

