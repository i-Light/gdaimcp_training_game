extends Node

signal gameover()

const screen_rect:Rect2 = Rect2(Vector2.ZERO, Vector2(960, 540))

var progress_counter:float = 1


func _physics_process(delta: float) -> void:
	progress_counter += delta*delta*2
