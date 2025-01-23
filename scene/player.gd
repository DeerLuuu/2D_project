#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name Player extends CharacterBody2D

# TODO 玩家 ===============>信 号<===============
#region 信号
signal is_dead(player : Player)
#endregion

# TODO 玩家 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家 ===============>变 量<===============
#region 变量
@onready var fsm: FSM = $FSM
@onready var health_model: HealthModel = $HealthModel

@export var speed : float
@export var jump_speed : float
@export var roll_speed : float
@export var slide_speed : float
@export var is_player_two : bool = false
@export var jump_count : int = 2
@export var damage : float = 10

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
var is_crouch : bool = false
var is_wall_slide : bool = false
var is_roll : bool = false
var is_slide : bool = false
var is_attack : bool =  false
var combo : int = 0
#endregion

# TODO 玩家 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	await get_tree().process_frame
	health_model.reset_health()

func _process(_delta: float) -> void:
	if not is_on_wall_only():
		dir = Input.get_axis("player_one_left", "player_one_right") if not is_player_two else Input.get_axis("player_two_left", "player_two_right")
	is_jump = Input.is_action_just_pressed("player_one_jump") if not is_player_two else Input.is_action_just_pressed("player_two_jump")
	is_roll = Input.is_action_just_pressed("player_one_roll") if not is_player_two else Input.is_action_just_pressed("player_two_roll")
	is_slide = Input.is_action_just_pressed("player_one_slide") if not is_player_two else Input.is_action_just_pressed("player_two_slide")
	is_crouch = Input.is_action_pressed("player_one_crouch") if not is_player_two else Input.is_action_pressed("player_two_crouch")
	is_wall_slide = Input.is_action_pressed("player_one_wall_slide") if not is_player_two else Input.is_action_pressed("player_two_wall_slide")
	is_attack = Input.is_action_pressed("player_one_attack") if not is_player_two else Input.is_action_pressed("player_two_attack")

func _physics_process(_delta: float) -> void:
	velocity.y += 9.8
	move_and_slide()

func _input(event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 玩家 ===============>信号链接方法<===============
#region 信号链接方法
func _on_health_model_health_update(current_health: float, max_health: float) -> void:
	print("当前血量%s" % current_health)
	if current_health == 0:
		fsm._on_state_switch("dead")
		is_dead.emit(self)

func _on_hurt_area_area_entered(area: Area2D) -> void:
	var enemy : Enemy = area.get_parent()
	health_model.current_health -= enemy.damage
	if health_model.current_health == 0: return
	fsm._on_state_switch("hit")
#endregion

# TODO 玩家 ===============>工具方法<===============
#region 工具方法

#endregion


func _on_combo_timer_timeout() -> void:
	combo = 0
