extends State

# TODO 怪物跟随玩家状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物跟随玩家状态 ===============>常 量<===============
#region 常量

#endregion

# TODO 怪物跟随玩家状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var look_player_ray: RayCast2D = $"../../LookPlayerRay"

var target : Player
#endregion

# TODO 怪物跟随玩家状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入了跟随玩家状态")
	animation_player.play("walk")
	target = look_player_ray.get_collider()

func update(_delta : float):
	if target:
		if target.global_position.distance_to(enemy.global_position) > 150:
			switch_state.emit("idle")
		if target.global_position.distance_to(enemy.global_position) < 30:
			switch_state.emit("attack")
	else :
		switch_state.emit("idle")

func physics_update(_delta : float):
	if not target: return
	if target.global_position.x < enemy.global_position.x:
		enemy.dir = -1
	else :
		enemy.dir = 1
	enemy.velocity.x = enemy.dir * enemy.speed

func exit():
	enemy.velocity.x = 0
#endregion

# TODO 怪物跟随玩家状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 怪物跟随玩家状态 ===============>工具方法<===============
#region 工具方法

#endregion
