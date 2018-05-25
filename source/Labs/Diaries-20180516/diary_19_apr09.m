%-- 09/04/2018 09:30 --%
prod(1:170)
format longG
prod(1:170)
prod(1:171)
moler_4_11
flintmax
char(sym(flintmax))
help flintmax
[F,E]=log2(factorial(22))
e=E-1, f=2*F-1
prod(1:sym(22))
prod(1:sym(44))
fplot(@gammaln)
fplot(@gammaln,[0 10])
gammalninv(5+randn(10,1))
gammalninv(5+randn(4))
psi(10)
fzero(@psi,2)
fminsearch(@gammaln,[0 2])
fminbnd(@gammaln,[0 2])
fminbnd(@gammaln,0,2)
syms x; assume(x>0); y0 = solve(psi(x)==0,x)
help fminbnd
gammalninv(-2)
log(exp(-100))
log(exp(-300))
log(exp(-700))
log(exp(-1000))
[y,yy]=gammalninv(80)
gammaln([y yy])
randncond
rand
randgui(@randssp)
isprime(2147483647)
randgui(@randmcg)
x=-log(rand(1e5,1));
histogram(x)
clf
histogram(x)
x=-log(rand(1e8,1));
histogram(x)
rho=rand(1e6,2);
r=sqrt(-2*log(rho(:,1)));
th=2*pi*rho(:,2);
x=r*cos(th);
x=r.*cos(th);
y=r.*sin(th);
histogram([x;y])
hold
z=linspace(-5,5,1e4);
g=max([x;y])*exp(-z.^2/2);
plot(z,g)
plot(z,g,'r')
c=histogram([x;y]);
g=max(c)*exp(-z.^2/2);
help histogram
c=histcounts([x;y]);
g=max(c)*exp(-z.^2/2);
plot(z,g,'r')
clf
histogram([x;y])
plot(z,g,'r')
histogram([x;y])
hold
plot(z,g,'r')
corr(x,y)
1:2:6
tic;randpolar(1e3);toc
tic;randn(1e3);toc
tic;randpolar(1e3);toc
tic;randn(1e3);toc
help rand
RandStream.getGlobalStream
rand('state',0)
RandStream.getGlobalStream
rand('state',0)
x = rand(1,2^24);
delta = .01;
k = diff(find(x<delta));
t = 1:99;
c = histc(k,t);
bar(t,c,'histc')
hold
bar(t,c,'histc')
x = rand(1,2^28);
clear x