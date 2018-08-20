clc;
clear all;
close all;

c = 299792458;
error = 1e-6;

f1 = [1000 0];
f2 = [-1000 0];
f3 = [0 1000];
p = [200 200];
 
d1 = calc_dist(f1,p);
d2 = calc_dist(f2,p);
d3 = calc_dist(f3,p);

for i=1:2
t1 = d1/c + (rand*2 - 1)*error;
t2 = d2/c + (rand*2 - 1)*error;
t3 = d3/c + (rand*2 - 1)*error;

hyperbola(f1,f2,t1,t2);
hold on
hyperbola(f2,f3,t2,t3);
hold on
hyperbola(f1,f3,t1,t3);
hold on
end
grid on
