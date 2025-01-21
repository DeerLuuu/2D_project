extends State

# TODO 翻滚状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 翻滚状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 翻滚状态 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
#endregion

# TODO 翻滚状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("玩家进入翻滚状态")
	animation_player.play("roll")
	player.velocity.x = player.roll_speed * player.last_dir

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func exit():
	player.velocity.x = 0
#endregion

# TODO 翻滚状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 翻滚状态 ===============>工具方法<===============
#region 工具方法

#endregion
