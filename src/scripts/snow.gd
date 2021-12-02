extends MeshInstance

onready var tween := $Tween
onready var material := get_surface_material(0)


func _ready() -> void:
	material.set_shader_param("dissolve_amount", 0.0)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		dissolve()


func dissolve():
	visible = true
	tween.interpolate_method(
		self, "animate_dissolve", 0.5, 0, 10, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()


func animate_dissolve(progress: float) -> void:
	material.set_shader_param("dissolve_amount", ease(progress, 0.4))


func _on_Tween_tween_completed(object, key):
	pass # Replace with function body.
