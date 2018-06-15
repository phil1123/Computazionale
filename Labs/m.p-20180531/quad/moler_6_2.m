S1 = [1 0 4 0 1]/6;
S2 = [1 4 2 4 1]/12;
Q = S2 + (S2 - S1)/15;
rats(Q)

%%
syms a b
c = (a+b)/2; d=(a+c)/2; e=(c+b)/2;
Q = @(f,a,b) (b-a)*(7*(f(a)+f(b))/90 + 16*(f(d)+f(e))/45 + 2*f(c)/15)

%%
for n = 1:6
    g = @(x) x^n;
    simplify(Q(g,a,b))
end