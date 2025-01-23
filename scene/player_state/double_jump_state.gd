extends State

# TODO 二段跳 ===============>信 号<===============
#region 信号

#endregion

# TODO 二段跳 ===============>常 量<===============
#region 常量

#endregion

# TODO 二段跳 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

#endregion

# TODO 二段跳 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	animation_player.play("jump")
	player.velocity.y = -player.jump_speed
	player.jump_count -= 1

func update(_delta : float):
	if player.is_on_wall_only() and player.is_wall_slide:
		switch_state.emit("wallSlide")
	if player.velocity.y > 0:
		switch_state.emit("fall")

func physics_update(_delta : float):
	player.velocity.x = player.dir * player.speed

func exit():
	player.velocity.x = 0
#endregion

# TODO 二段跳 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 二段跳 ===============>工具方法<===============
#region 工具方法

#endregion
