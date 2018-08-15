clc;
clear all;
close all;

syms x y;

c = 3e8;

x1 = 1000;
x2 = -1000;
y1 = 0;
y2 = 0;
delta_t = 1.333333333333333333333333333333333333333333333333333333333333333333e-6;

delta_d = c*delta_t;
a = delta_d/2;

alfa = 2*(x2 - x1);
beta = 2*(y2 - y1);
gamma = x1^2 - x2^2 + y1^2 -y2^2 - 4*a^2;

f(x,y) = (alfa^2 - 16*a^2)*x^2 + (beta^2 - 16*a^2)*y^2 + 2*alfa*beta*x*y + 2*(alfa*gamma + 16*a^2*x2)*x + 2*(beta*gamma + 16*a^2*y2)*y + gamma^2 - 16*a^2*(x2^2 + y2^2);

p=ezplot(f,[-1000,1000,-1000,1000]);

hold on