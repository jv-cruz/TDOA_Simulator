function [ hyp ] = random_error_hyperbola( x1,y1,x2,y2,x_o,y_o,error )

syms x y;

c = 299792458;

d1 = calc_dist(x1,y1,x_o,y_o);
d2 = calc_dist(x2,y2,x_o,y_o);

t1 = d1/c + (rand*2 - 1)*error;
t2 = d2/c + (rand*2 - 1)*error;

delta_t = abs(t1 - t2);

delta_d = c*delta_t;
a = delta_d/2;

alfa = 2*(x2 - x1);
beta = 2*(y2 - y1);
gamma = x1^2 - x2^2 + y1^2 -y2^2 - 4*a^2;

f(x,y) = (alfa^2 - 16*a^2)*x^2 + (beta^2 - 16*a^2)*y^2 + 2*alfa*beta*x*y + 2*(alfa*gamma + 16*a^2*x2)*x + 2*(beta*gamma + 16*a^2*y2)*y + gamma^2 - 16*a^2*(x2^2 + y2^2);

hyp = ezplot(f,[-1000,1000,-1000,1000]);

end

