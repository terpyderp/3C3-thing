extends Spatial


var starScenes:Array
var stars:Array

var width:int
var height:int = 128
var depth:int = 768
var speed:int = 64
var rotSpeed:float = 2
var amount:int = 512
var potatoMode = true
var time:float = 0


func _ready():
	OS.window_maximized = true
	width = (OS.window_size.x/OS.window_size.y)*height*2
	
	starScenes.append(load("res://starScenes/blue.tscn"))
	starScenes.append(load("res://starScenes/cyan.tscn"))
	starScenes.append(load("res://starScenes/green.tscn"))
	starScenes.append(load("res://starScenes/magenta.tscn"))
	starScenes.append(load("res://starScenes/orange.tscn"))
	starScenes.append(load("res://starScenes/red.tscn"))
	starScenes.append(load("res://starScenes/yellow.tscn"))
	
	randomize()
	
	resetParticles()


func _process(delta):
	width = (OS.window_size.x/OS.window_size.y)*height
	
	for i in stars:
		if i.translation.x <= -width/2:
			i.translation.x = width/2
			i.translation.y = rand_range(-height/2,height/2)
			i.translation.z = rand_range(-depth,0)
		else:
			i.translation.x -= delta*speed
	
	$Gnome.rotation.z -= delta*rotSpeed
	
	time += delta
	var temp = str(int(time*10)/10.0)
	if not "." in temp:
		temp = temp + ".0"
	$Control/Label.text = "You've been gnomed for\n" + temp + " seconds."


func _input(event):
	if event.is_action_pressed("ui_accept"):
		if potatoMode:
			potatoMode = false
			amount = 1024
			resetParticles()
		else:
			potatoMode = true
			amount = 512
			resetParticles()


func resetParticles():
	for i in stars:
		i.free()
	stars = []
	
	for i in range(0, amount):
		stars.append(starScenes[randi()%7].instance())
		add_child(stars[-1])
		stars[i].translation.x = rand_range(-width/2,width/2)
		stars[i].translation.y = rand_range(-height/2,height/2)
		stars[i].translation.z = rand_range(-depth,0)
