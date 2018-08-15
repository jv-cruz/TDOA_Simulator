function [ hyp ] = trucated_error_hyperbola( x1,y1,x2,y2,x_o,y_o )

syms x y;

c = 299792458;
trucated_value = 1e-6;

d1 = calc_dist(x1,y1,x_o,y_o);
d2 = calc_dist(x2,y2,x_o,y_o);

t1 = floor(d1/c/trucated_value)*trucated_value;
t2 = floor(d2/c/trucated_value)*trucated_value;
%t1 = d1/c;
%t2 = d2/c;

delta_t = abs(t1 - t2);

%delta_d = abs(d1 - d2);
delta_d = c*delta_t;
a = delta_d/2;

alfa = 2*(x2 - x1);
beta = 2*(y2 - y1);
gamma = x1^2 - x2^2 + y1^2 -y2^2 - 4*a^2;

f(x,y) = (alfa^2 - 16*a^2)*x^2 + (beta^2 - 16*a^2)*y^2 + 2*alfa*beta*x*y + 2*(alfa*gamma + 16*a^2*x2)*x + 2*(beta*gamma + 16*a^2*y2)*y + gamma^2 - 16*a^2*(x2^2 + y2^2);

hyp = ezplot(f,[-1000,1000,-1000,1000]);

end

