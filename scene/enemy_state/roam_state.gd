extends State

# TODO 漫游状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 漫游状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 漫游状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var roam_timer: Timer = $"../../RoamTimer"
@onready var look_player_ray: RayCast2D = $"../../LookPlayerRay"

#endregion

# TODO 漫游状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入漫游状态")
	animation_player.play("walk")
	var rand_int : int = randi_range(1, 100)
	enemy.dir = -1 if rand_int <= 50 else 1
	roam_timer.timeout.connect(
		func():
			switch_state.emit("idle")
	)
	roam_timer.start(2.)

func update(_delta : float):
	if look_player_ray.get_collider():
		switch_state.emit("follow")
	if enemy.is_on_wall():
		enemy.dir = enemy.get_wall_normal().x

func physics_update(_delta : float):
	enemy.velocity.x = enemy.dir * enemy.speed

func exit():
	enemy.velocity.x = 0
	roam_timer.stop()
#endregion

# TODO 漫游状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 漫游状态 ===============>工具方法<===============
#region 工具方法

#endregion
