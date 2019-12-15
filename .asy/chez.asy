// Inspired by olympiad.asy and cse5.asy
import graph;
import math;
usepackage("amsmath"); usepackage("amssymb");
size(7cm);

// ********************
// Adjustable variables
// ********************

// Nice colors
pen l_red = rgb(255, 130, 160),
    l_orange = rgb(255, 145, 66),
    l_green = rgb(100, 255, 140),
    l_blue = rgb(66, 160, 255),
    l_purple = rgb(200, 130, 255),
    d_red = rgb(200, 0, 0),
    d_orange = rgb(220, 105, 0),
    d_green = rgb(0, 100, 0),
    d_blue = rgb(0, 40, 140),
    d_purple = rgb(100, 0, 175);

pair origin = (0, 0);

pair midpoint(pair A, pair B);

real d(pair A, pair B){ return length(A - B); }

path CR(pair A, real r, real a=0, real b=360){
	if((a == 0) && (b == 360))
		return Circle(A, r);
	return Arc(A, r, a, b);
}
path CP(pair A, pair P, real a=0, real b=360){
	return CR(A, d(A, P), a, b);
}

pair midpoint(pair A, pair B){ return (A + B)/2; }

pair waypoint(path p, real r){
	return point(p, reltime(p, r));
}

pair foot(pair P, pair A, pair B){
	real s = dot(P - A, dir(B - A));
	return A + s * dir(B - A);
}

// Math
pair bary(pair A, pair B, pair C, real a, real b, real c){
	real normalization = a + b + c;
	return (a*A + b*B + c*C)/normalization;
}

pair circumcenter(pair A, pair B, pair C){
	real a = d(B, C), b = d(C, A), c = d(A, B);
	return bary(A, B, C,
		a^2 * (b^2 + c^2 - a^2),
		b^2 * (c^2 + a^2 - b^2),
		c^2 * (a^2 + b^2 - c^2));
}

real circumradius(pair A, pair B, pair C){
	return d(circumcenter(A, B, C), A);
}

path circumcircle(pair A, pair B, pair C){
	return CR(circumcenter(A, B, C), circumradius(A, B, C));
}

pair incenter(pair A, pair B, pair C){
	real a = d(B, C), b = d(C, A), c = d(A, B);
	return bary(A, B, C, a, b, c);
}

real inradius(pair A, pair B, pair C){
	real a = d(B, C), b = d(C, A), c = d(A, B);
	real s = (a + b + c)/2;
	return sqrt(s * (s - a) * (s - b) * (s - c))/s;
}

path incircle(pair A, pair B, pair C){
	return CR(incenter(A, B, C), inradius(A, B, C));
}

pair centroid(pair A, pair B, pair C){
	return bary(A, B, C, 1, 1, 1);
}

pair orthocenter(pair A, pair B, pair C){
	real a = d(B, C), b = d(C, A), c = d(A, B);
	real SA = (b^2 + c^2 - a^2)/2,
	     SB = (c^2 + a^2 - b^2)/2,
	     SC = (a^2 + b^2 - c^2)/2;
	return bary(A, B, C, 1/SA, 1/SB, 1/SC);
}
