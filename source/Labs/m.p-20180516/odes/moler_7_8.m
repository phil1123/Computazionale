function r32lambda = moler_7_8

syms u v p q real
r = (u^2+v^2)^(1/2)
F = [p; q; -u/r^3; -v/r^3]
y = [u ; v; p; q]
J = simplify(jacobian(F,y))

lambda = simplify(eig(J))
r32lambda = simplify(r^(3/2)*lambda);