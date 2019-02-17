extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var _dir = Vector2(0,0)

var _animplayer

func _ready():
	_animplayer = get_node("AnimationPlayer")
	
func _physics_process(delta):
	move_and_slide(velocity*speed)
	if(_dir != Vector2(0,0)):
		look_at(get_transform().origin+_dir);

func analog_force_change(inForce, inAnalog):
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
	
	