extends State

# TODO 玩家攻击2状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 玩家攻击2状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家攻击2状态 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

#endregion

# TODO 玩家攻击2状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	animation_player.play("attack2")

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func exit():
	player.combo += 1
	print(player.combo)
#endregion

# TODO 玩家攻击2状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 玩家攻击2状态 ===============>工具方法<===============
#region 工具方法

#endregion
