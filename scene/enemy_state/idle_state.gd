extends State

# TODO 怪物待机状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物待机状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 怪物待机状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var idle_timer: Timer = $"../../IdleTimer"
@onready var look_player_ray: RayCast2D = $"../../LookPlayerRay"

#endregion

# TODO 怪物待机状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入待机状态")
	animation_player.play("idle")
	idle_timer.timeout.connect(
		func():
			switch_state.emit("roam")
	)
	idle_timer.start(2.)

func update(_delta : float):
	if look_player_ray.get_collider():
		switch_state.emit("follow")

func physics_update(_delta : float):
	pass

func exit():
	idle_timer.stop()
#endregion

# TODO 怪物待机状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 怪物待机状态 ===============>工具方法<===============
#region 工具方法

#endregion
