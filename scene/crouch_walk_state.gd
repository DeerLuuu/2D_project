extends State

# TODO 下蹲移动状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 下蹲移动状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 下蹲移动状态 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

#endregion

# TODO 下蹲移动状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("玩家进入下蹲移动状态")
	animation_player.play("crouch_walk")

func update(_delta : float):
	if not player.is_crouch:
		switch_state.emit("idle")
	if player.dir == 0:
		switch_state.emit("crouch")

func physics_update(_delta : float):
	player.velocity.x = (player.speed / 2) * player.dir

func exit():
	player.velocity.x = 0
#endregion

# TODO 下蹲移动状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 下蹲移动状态 ===============>工具方法<===============
#region 工具方法

#endregion
