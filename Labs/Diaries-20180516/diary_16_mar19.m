%-- 19/03/2018 09:25 --%
dt=0.01;
F=@(t,y)[0 1;-1 0]*y;
Fa=@(q)-q;
myrk4(F,[0 4*pi],[0;1],dt)
myrk4(F,[0 20*pi],[0;1],dt)
dt=0.1;
myrk4(F,[0 20*pi],[0;1],dt)
dt=0.5;
myrk4(F,[0 20*pi],[0;1],dt)
sympint2(Fa,[0 20*pi],0,1,dt)
sympint2(Fa,[0 2*pi],0,1,dt)
clf
sympint2(Fa,[0 2*pi],0,1,dt)
sympint2(Fa,[0 20*pi],0,1,dt)
[t,y]=myrk4(F,[0 20*pi],[0;1],dt)
E=0.5*sum(y.^2,2);
plot(t,E)
[t,q,p]=sympint2(Fa,[0 20*pi],0,1,dt);
Es=0.5*(p.^2+q.^2);
hold
plot(t,Es)
[t,y]=myrk4(F,[0 200*pi],[0;1],dt);
E=0.5*sum(y.^2,2);
[t,q,p]=sympint2(Fa,[0 200*pi],0,1,dt);
Es=0.5*(p.^2+q.^2);
hold
plot(t,E)
hold
plot(t,Es)
clf
plot(t,y(:,1))
[t,y]=myrk4(F,[0 40*pi],[0;1],dt);
plot(t,y(:,1))
hold
plot(t,sin(t))
[t,q,p]=sympint2(Fa,[0 40*pi],0,1,dt);
hold
plot(t,q)
hold
plot(t,sin(t))
dt=0.5;
dt=0.01;
[t,q,p]=sympint2(Fa,[0 40*pi],0,1,dt);
hold
plot(t,q)
hold
plot(t,sin(t))
norm(q-sin(t),inf)
help ellipj
ellipke(0.5)
[sn,cn,dn]=ellipj(ellipk(0.5),0.5)
format longg
[sn,cn,dn]=ellipj(ellipk(0.5),0.5)
[sn,cn,dn]=ellipj(ellipk(1),1)
[sn,cn,dn]=ellipj(ellipk(0.1),0.1)
plot(t,cnoidal(t,1)
plot(t,cnoidal(t,1))
dbquit
plot(t,cnoidal(t,1))
dbquit
plot(t,cnoidal(t,1))
hold
plot(t,cnoidal(t,1))
t=linspace(0,4*pi,1e3);
plot(t,cnoidal(t,1))
holh
hold
plot(t,cos(t))
plot(t,cnoidal(t,0.5))
F=@(t,y)[y(2),-y(1)-y(1)^3];
[t,y]=myrk4(F,[0 40*pi],[0;1],dt);
F=@(t,y)[y(2);-y(1)-y(1)^3];
[t,y]=myrk4(F,[0 40*pi],[0;1],dt);
clf
plot(t,y(:,1))
[t,y]=myrk4(F,[0 4*pi],[1;0],dt);
plot(t,y(:,1))
hold
plot(t,cnoidal(t,1))
norm(y(:,1)-cnoidal(t,1),inf)