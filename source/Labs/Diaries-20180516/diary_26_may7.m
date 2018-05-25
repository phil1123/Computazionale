%-- 07/05/2018 09:32 --%
a=diag(ones(3,1),1)
a=a+a'
g=graph(a)
h=plot(g)
a(1,4)=1;
a(4,1)=1
g=graph(a)
h=plot(g)
b=diag(ones(7,1),1);
b=b+b';
a=kron(a,ones(7))+kron(ones(4),b);
a=kron(a,ones(7,1))+kron(ones(4,1),b);
a=kron(a,ones(8,1))+kron(ones(4,1),b);
a=kron(a,ones(8))+kron(ones(4),b);
g=graph(a)
h=plot(g)
a=diag(ones(3,1),1)
a(1,4)=1;
a=a+a'
a=kron(a,eye(8))+kron(eye(4),b);
g=graph(a)
h=plot(g);
layout(h,'force')
layout(h,'force3')
L=g.laplacian
L=full(g.laplacian)
gb=graph(b)
Lb=full(gb.laplacian)
Lbpbc=Lb;
Lbpbc(1,1)=2;
Lbpbc(8,8)=2;
Lbpbc(1,8)=-1;
Lbpbc(8,1)=-1;
Lbpbc
Lbdbc=Lbpbc;
Lbdbc(1,8)=0;
Lbdbc(8,1)=0;
Lbdbc
Lbpbc*Lbdbc-Lbdbc*Lbpbc
Lb
[u,e]=eig(Lbpbc);
diag()
diag(e)
format longg
diag(e)
Lbpbc
[e 4*sin(pi*(0:7)/8)]
[e 4*sin(pi*(0:7)'/8)]
[diag(e) 4*sin(pi*(0:7)'/8)]
[u,e]=eig(Lbpbc);
[diag(e) 4*sin(pi*(0:7)'/8)]
[diag(e) 4*sin(pi*(0:7)'/8).^2]
[u,e]=eig(Lbdbc);
[diag(e) 4*sin(pi*(0:7)'/8).^2]
[diag(e) 4*sin(pi*(0:7)'/16).^2]
[diag(e) 4*sin(pi*(1:8)'/16).^2]
[diag(e) 4*sin(pi*(1:8)'/18).^2]
plot(u(:,1))
hold
plot(0.5*sin(pi*(1:8)/9))
plot(sqrt(2/9)*sin(pi*(1:8)/9))
hold
plot(u(:,2))
hold
plot(sqrt(2/9)*sin(pi*2*(1:8)/9))
plot(-sqrt(2/9)*sin(pi*2*(1:8)/9))
norm(u(:,2)+sqrt(2/9)*sin(pi*2*(1:8)/9))
norm(u(:,2)-sqrt(2/9)*sin(pi*2*(1:8)/9))
norm(u(:,2)+sqrt(2/9)*sin(pi*2*(1:8)'/9))
Lb
[u,e]=eig(Lb);
hold
plot(u(:,1))
diag(e)
plot(u(:,2))
plot(u(:,2),'o-')
plot(u(:,3),'o-')
plot(u(:,4),'o-')
[diag(e) 4*sin(pi*(0:7)'/16).^2]
plot(u(:,2))
plot(u(:,2),'o-')
hold
plot(0.5*cos(pi*(1:8)/8),'*')
plot(10.5*cos(pi*(1:8)/8),'*')
clf
plot(u(:,2),'o-')
hold
plot(-0.5*cos(pi*(1:8)/8),'*')
plot(-0.5*cos(pi*(0:7)/8),'*')
plot(-0.5*cos(pi*(0.5:1:7.5)/8),'*')
L=full(g.laplacian);
hold
h=plot(g);
layout(h,'force3')
[u,e]=eig(L);
size(L)
diag(e)
g=squarelattice([-4 -8]);
h=plot(g);
layout(h,'force3')
layout(h,'force')
g=squarelattice([-4 -20]);
h=plot(g);
layout(h,'force3')
g=squarelattice([-4 -30]);
h=plot(g);
layout(h,'force3')
g=squarelattice([-5 -30]);
h=plot(g);
layout(h,'force3')
g=moebius(5,30)
h=plot(g);
layout(h,'force3')