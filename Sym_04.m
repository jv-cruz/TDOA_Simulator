clc;
clear all;
close all;

c = 299792458;
error = 1e-6;

f1 = [1000 0];
f2 = [-1000 0];
f3 = [0 1000];
p = [200 200];

plot(f1(1),f1(2),'m','Marker','o');
hold on
plot(f2(1),f2(2),'m','Marker','o');
hold on
plot(f3(1),f3(2),'m','Marker','o');
hold on
plot(p(1),p(2),'r*');
hold on

d1 = calc_dist(f1,p);
d2 = calc_dist(f2,p);
d3 = calc_dist(f3,p);

n_interactions = 10;
x_mean = 0;
y_mean = 0;
distances = zeros(1,n_interactions);

for i=1:n_interactions
    t1 = d1/c + (rand*2 - 1)*error;
    t2 = d2/c + (rand*2 - 1)*error;
    t3 = d3/c + (rand*2 - 1)*error;

    [h1,func1]=hyperbola(f1,f2,t1,t2);
    hold on
    [h2,func2]=hyperbola(f2,f3,t2,t3);
    hold on
    [h3,func3]=hyperbola(f1,f3,t1,t3);
    hold on
    intersec = fsolve(@(X)[h1(X(1),X(2)),h2(X(1),X(2))],p);
    plot(intersec(1),intersec(2),'bo');
    hold on
    x_mean = x_mean + intersec(1);
    y_mean = y_mean + intersec(2);
    distances(i) = calc_dist(intersec,p);
end
grid on

x_mean = x_mean/n_interactions;
y_mean = y_mean/n_interactions;
d_max = max(distances)
d_mean = calc_dist([x_mean y_mean],p)

plot(x_mean,y_mean,'ko');
hold on
