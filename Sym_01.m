clc;
clear all;
close all;

%c = 3e8;

syms x y;

x1 = 3;
x2 = -3;
y1 = 0;
y2 = 0;
%delta_t = 0.001;

%delta_d = c*delta_t;
delta_d = 4;

f(x,y) = delta_d + sqrt((x1 - x)^2 - (y1 - y)^2) - sqrt((x2 - x)^2 - (y2 - y)^2);

ezplot(f);