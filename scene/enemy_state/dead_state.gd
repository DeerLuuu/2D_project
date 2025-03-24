extends State

# TODO 怪物死亡状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物死亡状态 ===============>常 量<===============
#region 常量
const HIT = preload("res://scene/particles/hit.tscn")
#endregion

# TODO 怪物死亡状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var dead_audio: AudioStreamPlayer2D = $"../../DeadAudio"

#endregion

# TODO 怪物死亡状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入死亡状态")
	animation_player.play("dead")
	dead_audio.play()

	var hit : CPUParticles2D = HIT.instantiate()
	hit.gravity = Vector2.UP
	hit.amount = 99
	hit.finished.connect(func(): hit.queue_free())
	hit.emitting = true
	enemy.get_parent().add_child(hit)
	hit.global_position = enemy.global_position

	var camera : PlayerCamera = get_viewport().get_camera_2d()
	camera.camera_shake(0.2)
	camera.ice_time(0.1, 0.75)

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func exit():
	pass
#endregion

# TODO 怪物死亡状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 怪物死亡状态 ===============>工具方法<===============
#region 工具方法

#endregion
