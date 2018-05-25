%-- 10/05/2018 09:38 --%
g=moebius(2,3)
h=plot(g)
g0=squarelattice([-2 3])
L=full(g.laplacian)
L0=full(g0.laplacian)
L=L-diag(diag(L))
L=L+diag(4*ones(6,1))
L0=L0+diag(ones(6,1))
[u,e]=eig(L);
[u0,e0]=eig(L0);
diag(e)
format longg
diag(e)
diag(e0)
e0(1)=1
diag(e0)
[diag(e) diag(e0)]
meshgrid([-1 0 1],[1 2])
kron([-1 0 1],[1 2])
kron([-1 0 1],[1 1])+kron([1 1 1],[1 2])
kron(4*sin((pi/3)*[-1 0 1]).^2,[1 1])+kron([1 1 1],4*sin((pi/3)*[1 2]).^2)
ans(:)
kron(4*sin((pi/3)*[-1 0 1]).^2,[1 1])+kron([1 1 1],4*sin((pi/6)*[1 2]).^2)
ans(:)
[diag(e) diag(e0)]
[u(:,1) u0(:,1)]
g=moebius(20,50)
g0=squarelattice([-20 50])
L=full(g.laplacian);
L0=full(g0.laplacian);
[u0,e0]=eig(L0);
e0=diag(e0);
issorted(e0)
[e0,I]=sort(e0);
I(1:10)
u0=u0(:,I);
nnz(I-(1:1000)')
plot(I,e0)
plot(e0,I)
g0=squarelattice([20 50])
L0=full(g0.laplacian);
[u0,e0]=eig(L0);
issorted(e0)
e0=diag(e0);
issorted(e0)
[e0,I]=sort(e0);
u0=u0(:,I);
nnz(I-(1:1000)')
hold
plot(e0,I)
[u,e]=eig(L);
e=disg(e);
e=diag(e);
issorted(e)
plot(e,I)
sq=squarelattice([20 20 20])
help eigs
l=eigs(sq.laplacian,100,'sm');
figure(2)
plot(0:99,l)
plot(l,0:99)
issorted(l)
l=sort(l);
plot(l,0:99)
l=eig(full(sq.laplacian));
plot(l,0:7999)
plot(e,I)
g0=squarelattice(2000)
L0=full(g0.laplacian);
[u0,e0]=eig(L0);
e0=diag(e0);
issorted(l)
issorted(e0)
hold
plot(e0,1:2000)
hold
plot(e0.^2,1:2000)
plot(e0,(1:2000).^2)
g=squarelattice([20 20 20])
l=eigs(g.laplacian,100,'sm');
issorted(l)
l=sort(l);
plot(l,0:99)
l=eigs(g.laplacian,1000,'sm');
l=eig(full(g.laplacian));
plot(l,0:7999)
loglog(l,0:7999)
plot(l,(0:7999).^(3/2))
plot(l,(0:7999).^(2/3))
syms k
z=sym('z',[1 3])
2*z*cos((0:2)'*k)
taylor(2*z*cos((0:2)'*k),k,'order',5)
coeffs(ans,k)
solve(ans==[0 1 0])
a=ans;
a.z1
a.z2
a.z3
clear\
clear
N=125;
k=2*pi*(-(N-1)/2:(N-1)/2)/N;
k=fftshift(k);
k=2*pi*(-(N-1)/2:(N-1)/2)/N;
k=fftshift(k);
k=k';
L=ifft(diag(k.^2)*fft(eye(N));
L=ifft(diag(k.^2)*fft(eye(N)));
L=ifft(diag(4*sinn(k/2).^2)*fft(eye(N)));
L=ifft(diag(4*sin(k/2).^2)*fft(eye(N)));
g=squarelattice(125)
L0=full(g.laplacian);
noem(L(:)-L0(:))
norm(L(:)-L0(:))
k=2*pi*(-(N-1)/2:(N-1)/2)/N;
L=ifft(diag(4*sin(k/2).^2)*fft(eye(N)));
norm(L(:)-L0(:))
k=fftshift(k);
L=ifft(diag(4*sin(k/2).^2)*fft(eye(N)));
norm(L(:)-L0(:))
N=5;
k=2*pi*(-(N-1)/2:(N-1)/2)/N;
k=fftshift(k);
L=ifft(diag(4*sin(k/2).^2)*fft(eye(N)));
L
N=6;
N=5;
N=6;
k=2*pi*(-N/2:N/2-1)/N;
k=fftshift(k);
L=ifft(diag(4*sin(k/2).^2)*fft(eye(N)));
L
L(L<1e-10)=0
L=ifft(diag(4*sin(k/2).^2)*fft(eye(N)));
L(abs(L)<1e-10)=0
L=ifft(diag(k.^2)*fft(eye(N)));
L=(L+L')/2;