#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name Player extends CharacterBody2D

# TODO 玩家 ===============>信 号<===============
#region 信号
signal is_dead(player : Player)
signal combo_update(_combo : int)
#endregion

# TODO 玩家 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家 ===============>变 量<===============
#region 变量
@onready var fsm: FSM = $FSM
@onready var health_model: HealthModel = $HealthModel
@onready var combo_timer: Timer = $ComboTimer

@export var speed : float
@export var jump_speed : float
@export var roll_speed : float
@export var slide_speed : float
@export var is_player_two : bool = false
@export var jump_count : int = 2
@export var damage : float = 10:
	get():
		combo += 1
		combo_timer.start(1.)
		return damage
@export var exp_damage : float

@export_range(0., 1.) var critical_range : float

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
var skill_combo : int = 0
var combo : int = 0:
	set(v):
		combo = v
		combo_update.emit(combo)
var hit_dir : float
#endregion

# TODO 玩家 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	Global.players.append(self)
	is_dead.connect(Global._on_player_is_dead)
	await get_tree().process_frame
	health_model.reset_health()
	combo_timer.timeout.connect(func():
		combo = 0
		combo_timer.stop()
		)

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

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 玩家 ===============>信号链接方法<===============
#region 信号链接方法
func _on_health_model_health_update(current_health: float, _max_health: float) -> void:
	if current_health == 0:
		fsm._on_state_switch("dead")
		is_dead.emit(self)

func _on_hurt_area_area_entered(area: Area2D) -> void:
	var enemy : Enemy = area.get_parent()

	var critical_range_index : float = randf_range(0, 1)

	var is_critical : bool = false

	var _damage : float = enemy.damage + randi_range(-enemy.exp_damage, enemy.exp_damage)
	# 当攻击太低的时候保证至少1的伤害
	if _damage < 0: _damage = 1
	# 当进入暴击条件时伤害翻倍
	if critical_range_index < enemy.critical_range:
		_damage *= 2
		is_critical = true

	health_model.current_health -= _damage
	if health_model.current_health == 0: return

	var hit_label : HitLabel = preload("res://scene/labels/hit_label.tscn").instantiate()
	if is_critical:
		hit_label.scale = Vector2.ONE * .5
	hit_label.text = "%s" % _damage
	hit_label.global_position = global_position
	hit_label.global_position.y -= 20
	hit_label.global_position.x -= (hit_label.size / 2 * hit_label.scale).x
	get_parent().add_child(hit_label)

	hit_dir = -1 if enemy.global_position.x > global_position.x else 1

	fsm._on_state_switch("hit")

func _on_combo_timer_timeout() -> void:
	skill_combo = 0
#endregion

# TODO 玩家 ===============>工具方法<===============
#region 工具方法

#endregion
