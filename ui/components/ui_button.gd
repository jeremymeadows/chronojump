@tool
extends TextureButton


@export var text: String:
	set(val):
		text = val
		$Label.text = text
@export var text_color: Color = Color.BLACK:
	set(val):
		text_color = val
		$Label.add_theme_color_override('font_color', text_color)
@export var background_color: Color = Color.WHITE:
	set(val):
		background_color = val
		self_modulate = background_color
		if text_color in [Color.BLACK, Color.WHITE]:
			text_color = Color.BLACK if background_color.get_luminance() > 0.5 else Color.WHITE
