#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name Enemy extends CharacterBody2D

# TODO 怪物 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物 ===============>常 量<===============
#region 常量

#endregion

# TODO 怪物 ===============>变 量<===============
#region 变量
@onready var health_model: HealthModel = $HealthModel
@onready var fsm: FSM = $FSM
@export var speed : float
@export var damage : float = 10
@export var exp_damage : float
@export_range(0., 1.) var critical_range : float

var dir : float:
	set(v):
		dir = v
		if dir == -1:
			rotation = 0
			scale = Vector2(-1, 1)
		elif dir == 1 :
			rotation = 0
			scale = Vector2(1, 1)
var hit_dir : float
#endregion

# TODO 怪物 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	await get_tree().process_frame
	health_model.reset_health()

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	velocity.y += 9.8
	move_and_slide()

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 怪物 ===============>信号链接方法<===============
#region 信号链接方法
func _on_health_model_health_update(current_health: float, _max_health: float) -> void:
	if current_health == 0:
		fsm._on_state_switch("dead")

func _on_hurt_area_area_entered(area: Area2D) -> void:
	var player : Player = area.get_parent()
	var critical_range_index : float = randf_range(0, 1)

	var is_critical : bool = false

	var _damage : float = player.damage + randi_range(-player.exp_damage, player.exp_damage)
	# 当攻击太低的时候保证至少1的伤害
	if _damage < 0: _damage = 1
	# 当进入暴击条件时伤害翻倍
	if critical_range_index < player.critical_range:
		_damage *= 2
		is_critical = true

	health_model.current_health -= _damage

	var hit_label : HitLabel = preload("res://scene/labels/hit_label.tscn").instantiate()
	if is_critical:
		hit_label.scale = Vector2.ONE * .5
	hit_label.text = "%s" % _damage
	hit_label.global_position = global_position
	hit_label.global_position.y -= 20
	hit_label.global_position.x -= (hit_label.size / 2 * hit_label.scale).x
	get_parent().add_child(hit_label)

	if health_model.current_health == 0: return

	hit_dir = -1 if player.global_position.x > global_position.x else 1

	fsm._on_state_switch("hit")
#endregion

# TODO 怪物 ===============>工具方法<===============
#region 工具方法

#endregion
