extends State

# TODO 怪物受伤状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物受伤状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 怪物受伤状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

#endregion

# TODO 怪物受伤状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入受伤状态")
	animation_player.play("hit")
	enemy.health_model.current_health -= 10

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func exit():
	pass
#endregion

# TODO 怪物受伤状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 怪物受伤状态 ===============>工具方法<===============
#region 工具方法

#endregion
