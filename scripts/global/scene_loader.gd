#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends CanvasLayer

# TODO 场景加载器 ===============>信 号<===============
#region 信号

#endregion

# TODO 场景加载器 ===============>常 量<===============
#region 常量
const GAME_SCENE_PATH : Dictionary = {
	"Main" : "res://scene/main.tscn",
	"World" : "res://scene/world.tscn"
}

const FRAME_LABEL = preload("res://scripts/global/frame_label.tscn")
#endregion

# TODO 场景加载器 ===============>变 量<===============
#region 变量
var load_path : String
var frame_label : Label
#endregion

# TODO 场景加载器 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 场景加载器 ===============>工具方法<===============
#region 工具方法
func _ready() -> void:
	layer = 3
	frame_label = FRAME_LABEL.instantiate()
	add_child(frame_label)

func load_scene_of_const(current_scene : String, next_scene : String) -> void:
	if current_scene == next_scene: return

	if not GAME_SCENE_PATH.has(next_scene):
		printerr("当前游戏场景路径常量中没有这个场景，也许您需要填写一个名称而不是路径")
		return

	var load_panel_container = preload("res://scene/ui/load_panel_container.tscn").instantiate()
	add_child(load_panel_container)

	load_path = GAME_SCENE_PATH[next_scene]

	if not ResourceLoader.exists(load_path): return

	ResourceLoader.load_threaded_request(load_path, "", true)

func load_scene(next_scene : String) -> void:
	if not ResourceLoader.exists(next_scene): return

	var load_panel_container = preload("res://scene/ui/load_panel_container.tscn").instantiate()
	add_child(load_panel_container)

	ResourceLoader.load_threaded_request(next_scene, "", true)
#endregion
