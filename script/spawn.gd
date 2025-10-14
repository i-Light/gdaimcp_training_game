extends Marker2D

const BALL = preload("uid://txy8kj2ppuee")
@onready var timer: Timer = $Timer

func _ready() -> void:
	_on_timer_timeout()

func _on_timer_timeout() -> void:
	timer.wait_time = 0.5 / G.progress_counter
	var ball = BALL.instantiate()
	add_child(ball)
