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
@onready var skill_combo_timer: Timer = $"../../SkillComboTimer"

#endregion

# TODO 移动状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	animation_player.play("run")
	skill_combo_timer.start(.5)

func update(_delta : float):
	if player.is_attack:
		if (player.skill_combo + 1) % 2 == 0:
			switch_state.emit("attack2")
		else :
			switch_state.emit("attack")
	if player.is_slide:
		switch_state.emit("slide")
	if player.is_roll:
		switch_state.emit("roll")
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
	skill_combo_timer.stop()
#endregion

# TODO 移动状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 移动状态 ===============>工具方法<===============
#region 工具方法

#endregion
