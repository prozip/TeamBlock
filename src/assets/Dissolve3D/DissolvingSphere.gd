extends MeshInstance

onready var tween := $Tween
onready var material := get_surface_material(0)


func _ready() -> void:
	material.set_shader_param("dissolve_amount", 0.0)


func dissolve():
	print("disolve")
	self.visible = true
	$"../block_stone1_6_LOD1".visible = false
	tween.interpolate_method(
		self, "animate_dissolve", 0, 1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()


func animate_dissolve(progress: float) -> void:
	material.set_shader_param("dissolve_amount", ease(progress, 0.4))


func _on_Tween_tween_all_completed() -> void:
	self.visible = false
