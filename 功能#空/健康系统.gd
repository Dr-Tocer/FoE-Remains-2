class_name jkxt extends Node2D #健康系统
var tbsmz:int=35 #头部生命值
var xbsmz:int=85 #胸部生命值
var fbsmz:int=70 #腹部生命值
var zqtsmz:int=60 #左前蹄生命值
var yqtsmz:int=60 #右前蹄生命值
var zhtsmz:int=65 #左后蹄生命值
var yhtsmz:int=65 #右后蹄生命值
var bssmz:int=1000 #濒死生命值
func hqzsmz(): #获取总生命值
	return tbsmz+xbsmz+fbsmz+zqtsmz+yqtsmz+zhtsmz+yhtsmz

func kcsmz(bwsmz:int,zsh:int): #扣除生命值,bwsmz部位,zsh总伤害
	bwsmz-=zsh
	return bwsmz
