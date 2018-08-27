function [ hyp,f ] = hyperbola( p0,p1,t0,t1 )

x = linspace(-1000,1000,1000*2/0.01);
y = linspace(-1000,1000,1000*2/0.01);

c = 299792458;

x1 = p0(1); y1 = p0(2);
x2 = p1(1); y2 = p1(2);

delta_t = abs(t0 - t1);

delta_d = c*delta_t;
a = delta_d/2;

alfa = 2*(x2 - x1);
beta = 2*(y2 - y1);
gamma = x1^2 - x2^2 + y1^2 -y2^2 - 4*a^2;

hyp = @(x,y) (alfa^2 - 16*a^2)*x^2 + (beta^2 - 16*a^2)*y^2 + 2*alfa*beta*x*y + 2*(alfa*gamma + 16*a^2*x2)*x + 2*(beta*gamma + 16*a^2*y2)*y + gamma^2 - 16*a^2*(x2^2 + y2^2);
f = (alfa^2 - 16*a^2).*x.^2 + (beta^2 - 16*a^2).*y.^2 + 2*alfa*beta.*x.*y + 2*(alfa*gamma + 16*a^2*x2).*x + 2*(beta*gamma + 16*a^2*y2).*y + gamma^2 - 16*a^2*(x2^2 + y2^2);
fimplicit(hyp,[-1000,1000,-1000,1000]);
end

