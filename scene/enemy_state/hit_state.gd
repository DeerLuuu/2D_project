extends State

# TODO 怪物受伤状态 ===============>信 号<===============
#region 信号

#endregion

# TODO 怪物受伤状态 ===============>常 量<===============
#region 常量
const HIT = preload("res://scene/particles/hit.tscn")
#endregion

# TODO 怪物受伤状态 ===============>变 量<===============
#region 变量
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var hit_audio: AudioStreamPlayer2D = $"../../HitAudio"

@export var hit_arr : Array[AudioStreamWAV]
#endregion

# TODO 怪物受伤状态 ===============>状态模板方法<===============
#region 状态模板方法
func enter():
	print("怪物进入受伤状态")
	animation_player.play("hit")
	enemy.velocity = Vector2(enemy.hit_dir * 50, -50)
	hit_audio.stream = hit_arr[randi_range(0, 5)]

	var hit : CPUParticles2D = HIT.instantiate()
	hit.gravity.x = enemy.hit_dir * 98
	hit.finished.connect(func(): hit.queue_free())
	hit.emitting = true
	enemy.get_parent().add_child(hit)
	hit.global_position = enemy.global_position

	hit_audio.play()

	var camera : PlayerCamera = get_viewport().get_camera_2d()
	camera.camera_shake(0.05)
	camera.ice_time(0.2, 0.1)

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func exit():
	enemy.velocity = Vector2.ZERO
#endregion

# TODO 怪物受伤状态 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 怪物受伤状态 ===============>工具方法<===============
#region 工具方法

#endregion
