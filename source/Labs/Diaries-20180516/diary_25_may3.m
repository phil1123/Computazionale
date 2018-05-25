%-- 03/05/2018 09:33 --%
A=gallery(3)
e=eig(A)
[u,e]=eig(A)
norm(u(:,1))
[U,S,V] = svd(A)
norm(A-U*S*V')
A=randn(20,12);
[U,S,V] = svd(A);
norm(A-U*S*V')
A=magic(14)
rank(A)
[U,S,V] = svd(A);
norm(A-U*S*V')
diag(S)
A=gallery(3);
[U,S,V] = svd(A);
norm(A-U*S*V')
eigshow
rehash
eigshow
A = gallery(3)
[X,lambda] = eig(A);
condest(X)
cond(X)
A = gallery(3)
lambda = eig(A)
kappa = condeig(A)
format long
delta = 1.e-6;
lambda = eig(A + delta*randn(3,3))
lambda = eig(A + delta*randn(3,3))
A=2*diag(ones(16,1));
A=A+diag(ones(15,1),1)
e=eig(A)
A(16,1)=eps;
A
e=eig(A)
A(16,1)=5*eps;
A(:,1)
e=eig(A)
A = gallery(5)
e=eig(A)
plot(eig(gallery(5)))
clf
plot(eig(gallery(5)))
rank(A)
cond(A)
condeig(A)
condeig(randn(10))
B=randn(100);
B=B(B>0);
condeig(B)
B=B(B>0);
B=randn(100);
B(B<0)=0;
condeig(B)
condeig(randn(100))
A
condeig(A)
svd(A)
format long e
svd(A)
rank(A)
while 1
clc
svd(A+eps*randn(5,5).*A)
pause(.25)
end
jordan(A)
n = size(A,1)
I = eye(n,n)
s = A(n,n); [Q,R] = qr(A - s*I); A = R*Q + s*I
A=gallery(3)
I = eye(n,n)
n = size(A,1)
I = eye(n,n)
s = A(n,n); [Q,R] = qr(A - s*I); A = R*Q + s*I
format shortg
s = A(n,n); [Q,R] = qr(A - s*I); A = R*Q + s*I
A=A(1:2,1:2)
I = eye(2)
s = A(n,n); [Q,R] = qr(A - s*I); A = R*Q + s*I
n=2;
s = A(n,n); [Q,R] = qr(A - s*I); A = R*Q + s*I
eigsvdgui
load detail
subplot(2,2,1)
image(X)
colormap(gray(64))
axis image, axis off
r = rank(X)
title(['rank = ' int2str(r)])
clf
load detail
subplot(2,2,1)
image(X)
colormap(gray(64))
axis image, axis off
r = rank(X)
title(['rank = ' int2str(r)])
size(X)
X(1:4,1:4)
[u,s,v]=svd(X);
X1=u(:,1)*s(1,1)*v(:,1)';
subplot(2,2,2)
image(X1)
axis image, axis off
rank(X)
X20=u(:,1:20)*s(1:20,1:20)*v(:,1:20)';
subplot(2,2,3)
image(X20)
axis image, axis off
X20=u(:,1:100)*s(1:100,1:100)*v(:,1:100)';
subplot(2,2,4)
image(X100)
image(X20)
axis image, axis off
g=squarelattice(10)
plot(g)
clf
plot(g)
g=squarelattice(-10)
plot(g)
g=squarelattice([10,-5])
plot(g)
g=squarelattice([20,-100])
plot(g)
g=squarelattice([20,-40])
plot(g)
g=squarelattice([-20,100])
plot(g)
h=plot(g)
layout(h,'layered')
g=squarelattice([-20,-20])
plot(g)
g=squarelattice([-20,20])
plot(g)
g=squarelattice([20,-20])
plot(g)
g=squarelattice([20,-6])
plot(g)
g=squarelattice([10,-5])
plot(g)
g=squarelattice(6)
g.laplacian
full(g.laplacian)
plot(g)