clc;
clear all;
close all;

c = 299792458;
error = 1e-6;

f1 = [1000 0];
f2 = [-1000 0];
f3 = [0 1000];
p = [200 200];

plot(f1(1),f1(2),'b','Marker','o');
hold on
plot(f2(1),f2(2),'b','Marker','o');
hold on
plot(f3(1),f3(2),'b','Marker','o');
hold on
plot(p(1),p(2),'r*');
hold on

c



for i=1:2
    t1 = d1/c + (rand*2 - 1)*error;
    t2 = d2/c + (rand*2 - 1)*error;
    t3 = d3/c + (rand*2 - 1)*error;

    [h1,func1]=hyperbola(f1,f2,t1,t2);
    hold on
    [h2,func2]=hyperbola(f2,f3,t2,t3);
    hold on
    [h3,func3]=hyperbola(f1,f3,t1,t3);
    hold on
end
grid on

a = abs(func1-func2)<10;
b=sum(a);
