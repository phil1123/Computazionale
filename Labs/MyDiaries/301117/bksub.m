function x = bksub(U,b) %backsubstitutuion
n = length(b);  
x = zeros(n,1);  %inizializzazione
if isa(b,'sym')
    x = sym(x);
end
for k = n:-1:1
    x(k) = b(k)/U(k,k);         
    i = (1:k-1)';   %in C avrei dovuto fare due loop (qui uno è "nascosto", lo fa da solo)
    b(i) = b(i) - x(k)*U(i,k);
end


