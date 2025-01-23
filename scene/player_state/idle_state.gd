extends State

# TODO 待机状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 待机状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 待机状态 ===============>变 量<===============
#region 变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var combo_timer: Timer = $"../../ComboTimer"
#endregion

# TODO 待机状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	animation_player.play("idle")
	player.jump_count = 2
	combo_timer.start(.5)

func update(_delta : float):
	if player.is_attack:
		if (player.combo + 1) % 2 == 0:
			switch_state.emit("attack2")
		else :
			switch_state.emit("attack")
	if player.is_slide:
		switch_state.emit("slide")
	if player.is_roll:
		switch_state.emit("roll")
	if player.is_crouch:
		switch_state.emit("crouch")
	if player.velocity.y > 0:
		switch_state.emit("fall")
	if player.is_jump and player.jump_count > 0:
		switch_state.emit("jump")
	if player.dir != 0 and player.is_on_floor():
		switch_state.emit("run")

func physics_update(_delta : float):
	pass

func exit():
	combo_timer.stop()
#endregion

# TODO 待机状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 待机状态 ===============>工具方法<===============
#region 工具方法

#endregion
