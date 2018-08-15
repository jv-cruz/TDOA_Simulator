function [ d ] = calc_dist( p0,p1 )

x0 = p0(1); y0 = p0(2);
x1 = p1(1); y1 = p1(2);

d_x = x0 - x1;
d_y = y0 - y1;

d = sqrt(d_x^2 + d_y^2);

end

