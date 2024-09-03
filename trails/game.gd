extends Node2D


@onready var borders_scene = preload("res://scenes/borders.tscn")
@onready var ball_scene = preload("res://scenes/ball.tscn")


var ball: Ball = null
var border: Border = null
var borders: Border = null

var paddle_spawn_pos: Vector2


func _ready():
	var viewport_size = get_viewport_rect().size
	var paddle_spawn_pos_y_offset = 50
	paddle_spawn_pos.x = paddle_spawn_pos_y_offset
	paddle_spawn_pos.y = viewport_size.y / 2.0
	new_game(viewport_size)

func new_game(viewport_size):
	# enemy_paddle = paddle_scene.instantiate()
	borders = borders_scene.instantiate()
	ball = ball_scene.instantiate()

	add_child(borders)
	add_child(ball)