%-- 01/03/2018 09:37 --%
moler_7_8
open ode23tx
F=@(t,y)0; ode23tx(F,[0 10],1)
F=@(t,y)1; ode23tx(F,[0 10],1)
F=@(t,y)t; ode23tx(F,[0 10],1)
F=@(t,y)y; ode23tx(F,[0 10],1)
F=@(t,y)-y; ode23tx(F,[0 10],1)
F=@(t,y)1/(1-3*t); ode23tx(F,[0 10],1)
F=@(t,y)1/(1-0.25*t); ode23tx(F,[0 10],1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],0.1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],5)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],20)
[t,y]=ode23tx(F,[0 10],20);
plot(t,y,'.-')
hold
[t,y]=ode23tx(F,[0 10],5);
plot(t,y,'.-')
moler_7_2
help table
moler_7_2
table(name,res)
moler_7_2
format longg
moler_7_2
F=@(t,y)[y(2); -y(1)];
ode23tx(F,[0 10],[1;0])
clf
ode23tx(F,[0 10],[1;0])
opts = odeset('reltol',1.e-4,'abstol',1.e-6, ...
'outputfcn',@odephas2);
opts
ode23tx(F,[0 10],[1;0],opts)
axis square
opts.reltol=1e-6
opts=rmfield(opts,'reltol')
opts.RelTol=1e-2;
ode23tx(F,[0 20],[1;0],opts)
ode113(F,[0 20],[1;0],opts)
ode45(F,[0 20],[1;0],opts)
ode23(F,[0 20],[1;0],opts)
[t,y]=ode23(F,[0 20],[1;0],opts);
opts
plot(t,norm(y)^2/2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode45(F,[0 20],[1;0],opts);
figure(2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-6;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.AbsTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
kepler=@(t,y) [y(3:4); -y(1:2)/norm(y(1:2))^3]
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode23tx(kepler,[0 20],[1;0;0;1],opts)
ode23tx(kepler,[0 20],[1;0;0;0.5],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.5],opts)
ode113(kepler,[0 20],[1;0;0;0.01],opts)
opts.RelTol=1e-8;
opts.AbsTol=1e-8;
ode113(kepler,[0 5],[1;0;0;0.01],opts)
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.OutputFcn=[];
[t,y]=ode45(kepler,[0 5],[1;0;0;0.01],opts);
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
opts.RelTol=1e-6;
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
plot(y(:,1),y(:,2),'o-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.5],opts);
figure(1)
plot(y(:,1),y(:,2),'o-')
axis equal
figure(1)
axis equal
[t,y]=ode45(kepler,[0 3],[1;0;0;0],opts);
[t,y]=ode45(kepler,[0 3],[1;0;0;1e-4],opts);
diary on
moler_7_8
open ode23tx
F=@(t,y)0; ode23tx(F,[0 10],1)
F=@(t,y)1; ode23tx(F,[0 10],1)
F=@(t,y)t; ode23tx(F,[0 10],1)
F=@(t,y)y; ode23tx(F,[0 10],1)
F=@(t,y)-y; ode23tx(F,[0 10],1)
F=@(t,y)1/(1-3*t); ode23tx(F,[0 10],1)
F=@(t,y)1/(1-0.25*t); ode23tx(F,[0 10],1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],0.1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],5)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],20)
[t,y]=ode23tx(F,[0 10],20);
plot(t,y,'.-')
hold
[t,y]=ode23tx(F,[0 10],5);
plot(t,y,'.-')
moler_7_2
help table
moler_7_2
table(name,res)
moler_7_2
format longg
moler_7_2
F=@(t,y)[y(2); -y(1)];
ode23tx(F,[0 10],[1;0])
clf
ode23tx(F,[0 10],[1;0])
opts = odeset('reltol',1.e-4,'abstol',1.e-6, ...
'outputfcn',@odephas2);
opts
ode23tx(F,[0 10],[1;0],opts)
axis square
opts.reltol=1e-6
opts=rmfield(opts,'reltol')
opts.RelTol=1e-2;
ode23tx(F,[0 20],[1;0],opts)
ode113(F,[0 20],[1;0],opts)
ode45(F,[0 20],[1;0],opts)
ode23(F,[0 20],[1;0],opts)
[t,y]=ode23(F,[0 20],[1;0],opts);
opts
plot(t,norm(y)^2/2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode45(F,[0 20],[1;0],opts);
figure(2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-6;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.AbsTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
kepler=@(t,y) [y(3:4); -y(1:2)/norm(y(1:2))^3]
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode23tx(kepler,[0 20],[1;0;0;1],opts)
ode23tx(kepler,[0 20],[1;0;0;0.5],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.5],opts)
ode113(kepler,[0 20],[1;0;0;0.01],opts)
opts.RelTol=1e-8;
opts.AbsTol=1e-8;
ode113(kepler,[0 5],[1;0;0;0.01],opts)
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.OutputFcn=[];
[t,y]=ode45(kepler,[0 5],[1;0;0;0.01],opts);
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
opts.RelTol=1e-6;
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
plot(y(:,1),y(:,2),'o-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.5],opts);
figure(1)
plot(y(:,1),y(:,2),'o-')
axis equal
figure(1)
axis equal
[t,y]=ode45(kepler,[0 3],[1;0;0;0],opts);
[t,y]=ode45(kepler,[0 3],[1;0;0;1e-4],opts);
ode23tx(F,[0 10],[1;0])
clf
ode23tx(F,[0 10],[1;0])
opts = odeset('reltol',1.e-4,'abstol',1.e-6, ...
'outputfcn',@odephas2);
opts
ode23tx(F,[0 10],[1;0],opts)
axis square
opts.reltol=1e-6
opts=rmfield(opts,'reltol')
opts.RelTol=1e-2;
ode23tx(F,[0 20],[1;0],opts)
ode113(F,[0 20],[1;0],opts)
ode45(F,[0 20],[1;0],opts)
ode23(F,[0 20],[1;0],opts)
[t,y]=ode23(F,[0 20],[1;0],opts);
opts
plot(t,norm(y)^2/2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode45(F,[0 20],[1;0],opts);
figure(2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-6;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.AbsTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
kepler=@(t,y) [y(3:4); -y(1:2)/norm(y(1:2))^3]
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode23tx(kepler,[0 20],[1;0;0;1],opts)
ode23tx(kepler,[0 20],[1;0;0;0.5],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.5],opts)
ode113(kepler,[0 20],[1;0;0;0.01],opts)
opts.RelTol=1e-8;
opts.AbsTol=1e-8;
ode113(kepler,[0 5],[1;0;0;0.01],opts)
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.OutputFcn=[];
[t,y]=ode45(kepler,[0 5],[1;0;0;0.01],opts);
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
opts.RelTol=1e-6;
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
plot(y(:,1),y(:,2),'o-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.5],opts);
figure(1)
plot(y(:,1),y(:,2),'o-')
axis equal
figure(1)
axis equal
[t,y]=ode45(kepler,[0 3],[1;0;0;0],opts);
[t,y]=ode45(kepler,[0 3],[1;0;0;1e-4],opts);
diary on
moler_7_8
open ode23tx
F=@(t,y)0; ode23tx(F,[0 10],1)
F=@(t,y)1; ode23tx(F,[0 10],1)
F=@(t,y)t; ode23tx(F,[0 10],1)
F=@(t,y)y; ode23tx(F,[0 10],1)
F=@(t,y)-y; ode23tx(F,[0 10],1)
F=@(t,y)1/(1-3*t); ode23tx(F,[0 10],1)
F=@(t,y)1/(1-0.25*t); ode23tx(F,[0 10],1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],0.1)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],5)
F=@(t,y)cos(t*y); ode23tx(F,[0 10],20)
[t,y]=ode23tx(F,[0 10],20);
plot(t,y,'.-')
hold
[t,y]=ode23tx(F,[0 10],5);
plot(t,y,'.-')
moler_7_2
help table
moler_7_2
table(name,res)
moler_7_2
format longg
moler_7_2
F=@(t,y)[y(2); -y(1)];
ode23tx(F,[0 10],[1;0])
clf
ode23tx(F,[0 10],[1;0])
opts = odeset('reltol',1.e-4,'abstol',1.e-6, ...
'outputfcn',@odephas2);
opts
ode23tx(F,[0 10],[1;0],opts)
axis square
opts.reltol=1e-6
opts=rmfield(opts,'reltol')
opts.RelTol=1e-2;
ode23tx(F,[0 20],[1;0],opts)
ode113(F,[0 20],[1;0],opts)
ode45(F,[0 20],[1;0],opts)
ode23(F,[0 20],[1;0],opts)
[t,y]=ode23(F,[0 20],[1;0],opts);
opts
plot(t,norm(y)^2/2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode45(F,[0 20],[1;0],opts);
figure(2)
plot(t,sum(y.^2,2)/2)
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-6;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.RelTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
opts.AbsTol=1e-12;
[t,y]=ode113(F,[0 20],[1;0],opts);
plot(t,sum(y.^2,2)/2)
kepler=@(t,y) [y(3:4); -y(1:2)/norm(y(1:2))^3]
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode23tx(kepler,[0 20],[1;0;0;1],opts)
ode23tx(kepler,[0 20],[1;0;0;0.5],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.001],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode23tx(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.01],opts)
ode45(kepler,[0 20],[1;0;0;0.5],opts)
ode113(kepler,[0 20],[1;0;0;0.01],opts)
opts.RelTol=1e-8;
opts.AbsTol=1e-8;
ode113(kepler,[0 5],[1;0;0;0.01],opts)
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.AbsTol=1e-6;
opts.RelTol=1e-4;
ode45(kepler,[0 5],[1;0;0;0.01],opts)
opts.OutputFcn=[];
[t,y]=ode45(kepler,[0 5],[1;0;0;0.01],opts);
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
opts.RelTol=1e-6;
[t,y]=ode45(kepler,[0 1.8],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.01],opts);
plot(y(:,1),y(:,2),'.-')
plot(y(:,1),y(:,2),'o-')
[t,y]=ode45(kepler,[0 3],[1;0;0;0.5],opts);
figure(1)
plot(y(:,1),y(:,2),'o-')
axis equal
figure(1)
axis equal
[t,y]=ode45(kepler,[0 3],[1;0;0;0],opts);
[t,y]=ode45(kepler,[0 3],[1;0;0;1e-4],opts);
[t,y]=ode45(kepler,[0 3],[1;0;0;0],opts);
figure(1)
diary off