extends State

# TODO 怪物攻击状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物攻击状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 怪物攻击状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var look_player_ray: RayCast2D = $"../../LookPlayerRay"

var target : Player
#endregion

# TODO 怪物攻击状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入攻击状态")
	animation_player.play("attack")
	target = look_player_ray.get_collider()

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func exit():
	pass
#endregion

# TODO 怪物攻击状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 怪物攻击状态 ===============>工具方法<===============
#region 工具方法

#endregion
