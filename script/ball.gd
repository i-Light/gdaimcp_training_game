extends TextureRect

# default starts roughly with spanning 960 (the screen) per second
var speed: float = 960.0 * 0.1
var dir:Vector2

var ball_entered_screen:bool = false

func _ready() -> void:
	speed *= G.progress_counter
	dir = Vector2(randf_range(.25, .75), randf_range(-1, 1))
	texture=texture.duplicate()
	var rand_size:int = randi_range(32, floori(32.0*1.5))
	texture.width = rand_size
	texture.height = rand_size
	for clr in ["r", "g", "b"]:
		modulate[clr] = randf_range(0, 1)

func _physics_process(delta: float) -> void:
	var is_ball_inside_screen:bool = G.screen_rect.has_point(global_position)
	if not ball_entered_screen:
		ball_entered_screen = is_ball_inside_screen
	#if not is_ball_inside_screen and ball_entered_screen: 
		#queue_free()
		#return
	#position.x += speed*delta
	position += dir * speed * delta
	var mouse_position:Vector2 = get_global_mouse_position()
	var is_mouse_inside_screen:bool = G.screen_rect.has_point(mouse_position)
	if not is_mouse_inside_screen: return
	var is_mouse_colliding_with_ball:bool = get_global_rect().has_point(mouse_position)
	if is_mouse_colliding_with_ball:
		G.gameover.emit()
		return
