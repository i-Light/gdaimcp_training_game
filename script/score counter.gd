extends MarginContainer

@onready var score: Label = $score


func _ready() -> void:
	reset()
	G.gameover.connect(_on_gameover, CONNECT_ONE_SHOT)

func _on_gameover()->void:
	process_mode = Node.PROCESS_MODE_DISABLED
	
func _on_timer_timeout() -> void:
	increament_score()

func increament_score()->void:
	score.text = str(score.text.to_int() + 1)

func reset()->void:
	score.text = "0"
	
