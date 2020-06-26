extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var _dir = Vector2(0,0)

var _animplayer

var active = true

func _ready():
	_animplayer = get_node("AnimationPlayer")
	
func _physics_process(delta):
	move_and_slide(velocity*speed)
	if(_dir != Vector2(0,0)):
		look_at(get_transform().origin+_dir);

func analog_force_change(inForce, inAnalog):
	if active:
		if(inAnalog=="Left_Analog"):
			velocity.x = inForce.x
			velocity.y = -inForce.y
		if(inAnalog=="Right_Analog"):
			if(inForce.length() > 0.3):
				_dir = Vector2(inForce.y,inForce.x)

func Play_Scale_Animation():
	_animplayer.play("Anim")
	
func Stop_Scale_Animation():
	_animplayer.play("StopAnim")
	
func activate():
	active = true
	Play_Scale_Animation()

func deactivate():
	active = false
	Stop_Scale_Animation()

func _on_Analog_force_changed(event_current_force, event_analog_stick_name) -> void:
	analog_force_change(event_current_force, event_analog_stick_name)
