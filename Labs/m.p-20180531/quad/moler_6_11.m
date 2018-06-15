%% symbolically plus variable precision arithmetics
syms x
I = int(x^x,0,1)
vpa(I)

%% numerically, with floating point
[Q,cnt] = quadtx(@(x)x^x,0,1,1.e-18)
