%-- 22/03/2018 09:28 --%
omega = exp(-2*pi*i/n);
j = 0:n-1;
k = j'
F = omega.^(k*j)
n=6;
omega = exp(-2*pi*i/n);
j = 0:n-1;
k = j';
F = omega.^(k*j)
F'*F
real(F'*F)
F'*F
imag(F'*F)
real(F'*F)
F'*F
fftgui
sunspotstx
open sunspotstx
sunspotstx
y=randn(10,1)
format longg
y=randn(10,1)
n=10;
omega = exp(-2*pi*i/n);
j = 0:n-1;
k = j';
F = omega.^(k*j);
tic;F*y;toc
y=randn(100,1)
tic;F*y;toc
y=randn(1000,1);
tic;F*y;toc
size(F)
size(y)
y=randn(2000,1);
tic;F*y;toc
tic;fft(y);toc
y=randn(20000,1);
tic;fft(y);toc
y=randn(1e7,1);
tic;fft(y);toc
y=randn(10,1);
Y=simpletest(y);
norm(Y-fft(y))
y=randn(10,1);
Y=simpletest(y);
norm(Y-fft(y))
y=randn(100,1);
tic;Y=simpletest(y);toc
y=randn(1e3,1);
tic;Y=simpletest(y);toc
y=randn(1e4,1);
tic;Y=simpletest(y);toc
y=randn(5*2^4,1);
Y=simpletest(y);
norm(Y-fft(y))
y=randn(5*2^10,1);
tic;Y=simpletest(y);toc
tic;Y=simpletest(y,0);toc
tic;Y=fft(y);toc
y=randn(1023,1);
isprime(1023)
isprime(1027)
isprime(1031)
y=randn(1031,1);
tic;Y=simpletest(y,0);toc
tic;Y=fft(y);toc
y=randn(1024,1);
tic;Y=fft(y);toc
fftmatrix(7)
plot(fft(eye(10)))
axis equal
plot(fft(eye(1031)))
axis equal
plot(fft(eye(99)))
plot(fft(eye(59)))
axis equal
x=linspace(-5,5,1e3);
y=exp(-x.^2);
plot(x,y)
plot(real(fft(y)))
y=exp(-5*x.^2);
fty=fftshift(fft(y));
plot(real(fty))
plot(real(exp(1i*pi*(0:999)).*fty))
plot(imag(exp(1i*pi*(0:999)).*fty))
