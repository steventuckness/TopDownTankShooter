extends Node2D

export (int) var life = 20
export (int) var damage = 20

func take_damage(amount):
	life -= amount
	print('barrel life ' + str(amount))
	if life <= 0:
		$Sprite.visible = false
		$Smoke.emitting = false
		$CollisionShape2D.set_deferred('disabled', true)
		$ExplosionArea/CollisionShape2D.set_deferred('disabled', false)
		$Explosion.visible = true
		$Explosion.play()
		return
		
	if life <= 10:
		$Smoke.emitting = true
	
func _on_ExplosionArea_body_entered(body):
	print('body entered')
	if body.has_method("take_damage"): 
		body.take_damage(damage)


func _on_Explosion_animation_finished():
	queue_free()
