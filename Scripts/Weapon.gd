extends Spatial

export var current_score = 0
export var fire_rate = 1
export var clip_size = 4
export var reload_rate = 2

onready var raycast = $"../Player/Pivot/Camera/Look"
onready var ammo_label = $"../Node/Ammo"
onready var score_label = $"../Node/Score"

var current_ammo = clip_size
var can_fire = true
var reloading = false

func _process(delta):
	score_label.set_text("%d" % [current_score])
	ammo_label.set_text("%d / %d" % [current_ammo, clip_size])
	if Input.is_action_just_pressed("primary_fire") and can_fire:
		if current_ammo > 0 and not reloading:
			fire()
		elif not reloading:
			reload()
	if Input.is_action_just_pressed("reload") and not reloading:
		reload()

func check_collision():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("Enemies"):
			collider.queue_free()
			current_score += 10

func fire():
	can_fire = false
	check_collision()
	current_ammo -= 1
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire= true

func reload():
	reloading = true
	yield(get_tree().create_timer(reload_rate), "timeout")
	current_ammo = clip_size
	reloading = false
