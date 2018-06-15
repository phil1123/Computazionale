%-- 05/04/2018 09:38 --%
x=linspace(-5,5,1024);
y=exp(-5*x.^2);
plot(y)
exp(-5*x(end)^2)
plot(x,y)
plot(x,y,'.-')
fy=fft(y);
plot(real(y))
plot(real(fy))
fy=fftshift(fft(y));
help fftshift
plot(real(fy),'.-')
fy=exp(i1*pi*(0:1023)).*fftshift(fft(y));
fy=exp(1i*pi*(0:1023)).*fftshift(fft(y));
plot(real(fy),'.-')
fy=fftshift(fft(y));
plot(real(fy),'.-')
fy=exp(1i*pi*(0:1023)).*fftshift(fft(y));
plot(real(fy),'.-')
plot(imag(fy),'.-')
x=linspace(-5,5,2048);
y=exp(-5*x.^2);
fy=exp(1i*pi*(0:1023)).*fftshift(fft(y));
fy=exp(1i*pi*(0:2047)).*fftshift(fft(y));
plot(imag(fy),'.-')
x=linspace(-5,5,512);
y=exp(-5*x.^2);
fy=exp(1i*pi*(0:511)).*fftshift(fft(y));
plot(imag(fy),'.-')
fy=sfft(y);
plot(imag(fy),'.-')
x=linspace(-5,5,2048);
y=exp(-5*x.^2);
fy=sfft(y);
plot(imag(fy),'.-')
plot(real(fy),'.-')
x=
y=exp(-x.^2);
plot(x,y,'.-')
fy=sfft(y);
plot(real(fy),'.-')
y=exp(-20*x.^2);
plot(x,y,'.-')
fy=sfft(y);
plot(real(fy),'.-')
y=exp(-60*x.^2);
plot(x,y,'.-')
fy=sfft(y);
plot(real(fy),'.-')
y=exp(-60*(x-2).^2);
plot(x,y,'.-')
y=exp(-60*(x-pi).^2);
plot(x,y,'.-')
size(y)
N=2048;
y=y([N/4:end,1:N/4-1])
plot(x,y,'.-')
testranslate('linear')
testranslate('pchip')
testranslate('spline')
testranslate('fft')
plot(x,y,'.-')
translate(y,-789.66)
plot(x,y,'.-')
translate(y,-789.66)
plot(x,y,'.-')
translate(y,789.66)
plot(x,y,'.-')
translate(y,789.66)
inputname
inputname(1)
dbquit
translate(y,789.66)
plot(x,y,'.-')
y=y';
x=x';
translate(y,789.66)
plot(x,y,'.-')
translate(y,789.66)
plot(x,y,'.-')
translate(y,789.66)
plot(x,y,'.-')
testranslate('fft')
plot(x,y,'.-')
for j=1:1000; translate(y,3.35);end
size(y)
for j=1:1000; translate(y,13.35);end
for j=1:1000; translate(y,13);end
for j=1:1000; translate(y,789.66);end
translate(y,789.66)
for j=1:1000; translate(y,3.35);end
for j=1:10000; translate(y,3.35);end
plot(x,y,'.-')
for j=1:10000; translate(y,3.35);end
plot(x,y,'.-')
for j=1:10000; translate(y,3.35,'spline');end
plot(x,y,'.-')
for j=1:10000; translate(y,3.35,'pchip');end
plot(x,y,'.-')
for j=1:10000; translate(y,3.35,'pchip');end
plot(x,y,'.-')
y=exp(-30*(x-pi).^2);
plot(x,y,'.-')
for j=1:10000; translate(y,3.35,'fft');end
plot(x,y,'.-')
plot(x,imag(y),'.-')
for j=1:10000; translate(y,3.35,'fft');end
plot(x,y,'.-')
for j=1:10000; translate(y,7.35,'fft');end
plot(x,y,'.-')