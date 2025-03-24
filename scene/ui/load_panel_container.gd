#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends PanelContainer

# TODO name ===============>信 号<===============
#region 信号

#endregion

# TODO name ===============>常 量<===============
#region 常量

#endregion

# TODO name ===============>变 量<===============
#region 变量
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $ProgressBar/Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var is_can_process : bool = false
var update : float = 0.0
var loader_prograss : Array
#endregion

# TODO name ===============>虚方法<===============
#region 常用的虚方法
func _enter_tree() -> void:
	get_tree().paused = true

func _exit_tree() -> void:
	get_tree().paused = false

func _process(_delta: float) -> void:
	if not is_can_process: return
	ResourceLoader.load_threaded_get_status(SceneLoader.load_path, loader_prograss)

	# 0, 0.5, 0.9, 1.0
	if loader_prograss[0] > update:
		update = loader_prograss[0]

	if progress_bar.value < update:
		progress_bar.value = lerp(progress_bar.value, update, .5)
		label.text = "%s%%" % int(progress_bar.value * 100)

	if progress_bar.value == 1.:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(SceneLoader.load_path))
		is_can_process = false
		animation_player.play("exit")
#endregion

# TODO name ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO name ===============>工具方法<===============
#region 工具方法

#endregion
