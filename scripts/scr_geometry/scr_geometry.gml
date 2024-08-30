// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Vector2(_x, _y) constructor {
    x = _x;
    y = _y;

    static add = function( _other ) {
		return new Vector2(x + _other.x, y + _other.y)
    }
	
	static subtract = function( _other ) {
		return new Vector2(x - _other.x, y - _other.y)
    }
	
	static multiply = function( _k ) {
		return new Vector2(x * _k, y * _k)
    }
	
	static normalize = function() {
		var _l = point_distance(0, 0, x, y)
		if _l != 0 {
			return new Vector2(x/_l, y/_l)
		}
		return new Vector2(0, 1)
    }
	
	static dot = function(_other) {
		return x * _other.x + y*_other.y
    }
}

function closest_point_on_line(_xp, _yp, _x0, _y0, _x1, _y1){
	var _vp = new Vector2(_xp, _yp)
	var _vl = new Vector2(_x0, _y0)
	var _vu = new Vector2(_x1 - _x0, _y1 - _y0).normalize()
	
	var _d = _vp.subtract(_vl).dot(_vu);
	var _pinf = _vl.add(_vu.multiply(_d))
	var _outx = place_within(_pinf.x, _x0, _x1);
	var _outy = place_within(_pinf.y, _y0, _y1);
	return new Vector2(_outx, _outy)
}

function closest_point_on_circle(_xp, _yp, _x0, _y0, _r){
	if point_distance(_xp, _yp, _x0, _y0) < _r {
		return new Vector2(_xp, _yp);
	}

	var _vl = new Vector2(_x0, _y0)
	var _vu = new Vector2(_xp - _x0, _yp - _y0).normalize()
	
	return _vl.add(_vu.multiply(_r))
}


function place_within(_v, _a, _b) {
	if _a < _b {
		return clamp(_v, _a, _b)
	}
	return clamp(_v, _b, _a)
}

function get_line_points(_x, _y, _length, _angle){
	var _dv = angletovec2(_angle).multiply(_length);
	
	return {
		 x0: _x - _dv.x/2,	
		 y0: _y - _dv.y/2,
		 x1: _x + _dv.x/2,	
		 y1: _y + _dv.y/2,
	}
}


function angletovec2(_angle) {
	var _ux =  dcos(_angle);
	var _uy =  dsin(-_angle);
	
	return new Vector2(_ux, _uy)
}