function x = bksub(U,b)
n = length(b);
x = zeros(n,1);
if isa(b,'sym')
   x = sym(x); 
end
for k = n:-1:1
    x(k) = b(k)/U(k,k);
    i = (1:k-1)';
    b(i) = b(i) - x(k)*U(i,k);
end