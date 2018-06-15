function A = badlycond(n)

A = eye(n,n) - triu(ones(n,n),1);
norm(A,1)
norm(inv(A),1)