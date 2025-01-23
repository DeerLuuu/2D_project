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

var dir : float:
	set(v):
		dir = v
		if dir == -1:
			rotation = 0
			scale = Vector2(-1, 1)
		elif dir == 1 :
			rotation = 0
			scale = Vector2(1, 1)
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

func _input(event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 怪物 ===============>信号链接方法<===============
#region 信号链接方法
func _on_health_model_health_update(current_health: float, max_health: float) -> void:
	print("当前血量%s" % current_health)
	if current_health == 0:
		fsm._on_state_switch("dead")

func _on_hurt_area_area_entered(area: Area2D) -> void:
	var player : Player = area.get_parent()
	health_model.current_health -= player.damage
	if health_model.current_health == 0: return
	fsm._on_state_switch("hit")
#endregion

# TODO 怪物 ===============>工具方法<===============
#region 工具方法

#endregion
