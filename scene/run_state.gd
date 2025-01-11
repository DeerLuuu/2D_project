extends State

# TODO 移动状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 移动状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 移动状态 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

#endregion

# TODO 移动状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("玩家进入移动状态")
	animation_player.play("run")

func update(_delta : float):
	if player.is_crouch:
		switch_state.emit("crouch")
	if player.is_jump and player.jump_count > 0:
		switch_state.emit("jump")
	if player.dir == 0:
		switch_state.emit("idle")

func physics_update(_delta : float):
	player.velocity.x = player.dir * player.speed

func exit():
	player.velocity.x = 0
#endregion

# TODO 移动状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 移动状态 ===============>工具方法<===============
#region 工具方法

#endregion
