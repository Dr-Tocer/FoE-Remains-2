class_name shxt extends Node2D #伤害系统
var xdsd:float
var jcsh:int
var zsh:int
var sjctl:int

func sdshjs(x,r):#x子弹实际速度,r子弹面板速度
	zsh=(jcsh*(-0.8*x**2/r**2+1.8*x/r)+1)
	return zsh 
func sdctljs(ctl,x,r):
	sjctl=(ctl*(-0.8*x**2/r**2+1.8*x/r)+1)
	pass
