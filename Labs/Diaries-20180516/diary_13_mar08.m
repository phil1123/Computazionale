%-- 08/03/2018 09:38 --%
myrk4(@(t,y)[0 1;-1 0]y,[0 pi],[1;0],1e-4)
myrk4(@(t,y)[0 1;-1 0]*y,[0 pi],[1;0],1e-4)
myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],1e-3)
[t,y]=myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],1e-3);
y(end,:)
format longg
y(end,:)
[t,y]=ode23tx(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],1e-12);
y(end,:)
opt=optimset
opt=odeset
opt.RelTol=1e-8;
opt.AbsTol=1e-12;
[t,y]=ode45(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],opt);
y(end,:)
opt.RelTol=1e-12;
[t,y]=ode45(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],opt);
y(end,:)
[t,y]=ode113(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],opt);
y(end,:)
size(t)
2*pi/98
t(1:10)
t(1:30)
[t,y]=ode45(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],opt);
size(t)
t(1:30)
histogram(t)
histogram(diff(t))
[t,y]=ode113(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],opt);
histogram(diff(t))
[t,y]=ode23(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],opt);
histogram(diff(t))
y(end,:)
[t,y]=myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],1e-3);
histogram(diff(t))
[t,y]=myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],1e-1);
y(end,:)
[t,y]=myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],1e-2);
y(end,:)
[t,y]=myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],pi/50);
y(end,:)
[t,y]=myrk4(@(t,y)[0 1;-1 0]*y,[0 2*pi],[1;0],pi/100);
y(end,:)
orderofrk4
isequal(chk1,chk2)
subs(chk1,a,[0:5])
subs(chk2,a,[0:5])
lorenzgui
open lorenzgui
open lorenz
lorenz
open lorenzgui
[t,y]=lorenzode([0 100],28);
plot(t,y(:,1:2))
plot(t,y(:,2:3))
[t,y]=lorenzode([0 100],130);
plot(t,y(:,2:3))
delta = 0.01;
F = @(t,y) y^2 - y^3;
opts = odeset('RelTol',1.e-4);
ode45(F,[0 2/delta],delta,opts);
ode45(F,[0 2e4],1e-4,opts);
ode45(F,[0 2e5],1e-5,opts);
ode23s(F,[0 2e5],1e-5,opts);
y = dsolve('Dy = y^2 - y^3','y(0) = 1/100');
y = simplify(y);
pretty(y)
ezplot(y,0,200)
y = dsolve('Dy = y^2 - y^3','y(0) = 1/100');
which lambertw
y = dsolve('DDy = -y','y(0) = 1');
y = dsolve('Dy = -y','y(0) = 1');
y
y = dsolve('D^2y = -y','y(0) = 1');
y = dsolve('D2y = -y','y(0) = 1');
y
y = dsolve('D2y = -y');
y
y = dsolve('D2y = -y -t*y^2');
opt=odeset
[t,y]=chute(1/15,4/15);
