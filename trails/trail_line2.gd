extends Line2D

var previous_position: Vector2 = Vector2.ZERO
var ball_radius: float = 0.0
var twirl_frequency: float = 24.0
var twirl_time: float = 0.0

func _ready():
	var texture = get_parent().texture
	ball_radius = texture.get_size().x * 0.5
	previous_position = get_parent().global_position
	
func _process(delta):
	var current_position = get_parent().global_position
	var direction  = (current_position - previous_position).normalized()
	
	twirl_time += delta * twirl_frequency
	var twirl_offset = Vector2(cos(twirl_time) * ball_radius, sin(twirl_time) * ball_radius)
	
	add_point((current_position - ball_radius * direction) + twirl_offset)
	if points.size() > 30:
		remove_point(0)
		
	previous_position = current_position
