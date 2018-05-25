%-- 19/02/2018 09:39 --%
moler_6_2
format compact
Q
rats(Q)
moler_6_2_alt
a
a'
open quadtx
quadgui
quadgui(@sin,0,pi,1e-8)
quadgui(@sqrt,0,pi,1e-8)
quadtx(@(x)sqrt(x).*log(x),0,pi,1e-8)
[Q,c]=quadtx(@(x)sqrt(x).*log(x),eps,pi,1e-8)
format longg
[Q,c]=quadtx(@(x)sqrt(x).*log(x),eps,pi,1e-8)
[Q,c]=quadtx(@(x)sqrt(x).*log(x),realmin,pi,1e-8)
[Q,c]=quadtx(@(x)sqrt(x).*log(x),realmin,pi,1e-12)
[Q,c]=quad(@(x)sqrt(x).*log(x),realmin,pi,1e-12)
[Q,c]=quadgui(@(x)tan(sin(x))-sin(tan(x)),realmin,pi,1e-12)
[Q,c]=quadgui(@(x)tan(sin(x))-sin(tan(x)),0,pi,1e-8)
[Q,c]=quadtx(@(x)tan(sin(x))-sin(tan(x)),0,pi,1e-8)
[Q,c]=quadtx(@(x)tan(sin(x))-sin(tan(x)),0,pi,1e-10)
[Q,c]=quadtx(@(x)cos(x).^2,0,4*pi,1e-10)
Q/pi
[Q,c]=quadtx(@(x)cos(x).^2,1,4*pi+1,1e-10)
Q/pi
[Q,c]=quad(@(x)cos(x).^2,0,4*pi,1e-10)
Q/pi
[Q,c]=quad(@(x)cos(x).^2,0,4*pi,1e-8)
Q/pi
ezplot(@humps,[0,1])
ezplot(@humps,0,1)
fplot(@humps,[0,1])
fplot(@humps,0,1)
ezplot(@humps,0,1)
syms x
h = 1/((x-.3)^2+.01) + 1/((x-.9)^2+.04) - 6
I = int(h)
Qe=double(I)
Qe=double(simplify(I))
I=int(h,0,1)
Qe=double(I)
Qe=vpa(I)
help trapz
moler_6_10
I
int(x^x)
int(x*log(x))
0.78343051071213440705926438652697
[Q,c]=quad(@(x)1./sin(sqrt(abs(x))),-1,2,1e-8)
int(1/sin(sqrt(abs(x)))
int(1/sin(sqrt(abs(x))))
double(int(1/sin(sqrt(abs(x))),-1,2))
5.314094432453683

