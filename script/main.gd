extends Node

@onready var game: Node2D = $game
@onready var restart_panel: PanelContainer = $"ui/restart_container"

func _ready() -> void:
	G.gameover.connect(_on_gameover, CONNECT_ONE_SHOT)
	Engine.time_scale = 5

func _on_gameover()->void:
	game.process_mode = Node.PROCESS_MODE_DISABLED
	restart_panel.show()


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
