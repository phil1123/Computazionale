function chk = asimplecheck

syms x a b
for p = 0:6
    I(p+1) = int(x^p,a,b); 
end
I = I.'

%%
S1 = [sym(1) 0 4 0 1]/6;
S2 = [sym(1) 4 2 4 1]/12;
Q = S2 + (S2 - S1)/15;

%%
x(1) = a;
x(3) = (a+b)/2;
x(2) = (a+x(3))/2;
x(4) = (x(3)+b)/2;
x(5) = b;
x = x.';
for p = 0:6
    J(p+1) = (b-a)*Q*x.^p;
end
J = simplify(J.','Steps',100)

chk = I-J;