syms x
Iexact = real(double(int(1/sin(sqrt(x)),0,pi^2)));

for j = 1:9
    tol(j) = 10^(-5-j);
    tic;
    Iquad = integral(@(x)1./sin(sqrt(x)),0,pi^2,'Reltol',0,'Abstol',tol(j));
    T(j) = toc;
    Delta(j) = Iquad/Iexact-1;
end

