// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_create(_x, _y, _obj, _struct={}){
	return instance_create_depth(_x, _y, 0, _obj, _struct)
}