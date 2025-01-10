#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name Player extends CharacterBody2D

# TODO 玩家 ===============>信 号<===============
#region 信号

#endregion

# TODO 玩家 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家 ===============>变 量<===============
#region 变量
@export var speed : float
@export var jump_speed : float
@export var is_player_two : bool = false
@export var jump_count : int = 2

var dir : float:
	set(v):
		dir = v
		if last_dir != dir and dir != 0:
			last_dir = dir

var last_dir : float:
	set(v):
		last_dir = v
		if last_dir == -1:
			rotation = 0
			scale = Vector2(-1, 1)
		elif last_dir == 1 :
			rotation = 0
			scale = Vector2(1, 1)

var is_jump : bool = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
#endregion

# TODO 玩家 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	dir = Input.get_axis("player_one_left", "player_one_right") if not is_player_two else Input.get_axis("player_two_left", "player_two_right")

	is_jump = Input.is_action_just_pressed("player_one_jump") if not is_player_two else Input.is_action_just_pressed("player_two_jump")

	if velocity.y < 0:
		animation_player.play("jump")
	elif velocity.y > 0:
		animation_player.play("fall")
	elif velocity.x != 0:
		animation_player.play("run")
	else :
		animation_player.play("idle")

func _physics_process(_delta: float) -> void:
	if is_on_floor():
		jump_count = 2
	else :
		velocity.y += 9.8

	if is_jump and jump_count > 0:
		jump_count -= 1
		velocity.y = -jump_speed

	velocity.x = dir * speed
	move_and_slide()

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 玩家 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 玩家 ===============>工具方法<===============
#region 工具方法

#endregion
