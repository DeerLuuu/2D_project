extends State

# TODO 玩家爬墙状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 玩家爬墙状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家爬墙状态 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

#endregion

# TODO 玩家爬墙状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	animation_player.play("wall_slide")
	player.velocity.y = 0

func update(_delta : float):
	if player.is_jump:
		switch_state.emit("WallSlideJump")
	elif not player.is_wall_slide or \
	player.last_dir == player.get_wall_normal().x or \
	player.is_on_floor():
		switch_state.emit("idle")

func physics_update(_delta : float):
	player.velocity.y -= 7.2

func exit():
	pass
#endregion

# TODO 玩家爬墙状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 玩家爬墙状态 ===============>工具方法<===============
#region 工具方法

#endregion
