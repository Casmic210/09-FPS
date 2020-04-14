extends Area

var speed = 15
var velocity = Vector3()

func start(start_from):
	transform = start_from
	velocity = transform.basis.z * speed
