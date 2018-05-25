n=10000;
y=randn(n,1);
omega = exp(-2*pi*i/n);
j = 0:n-1;
k = j';
F = omega.^(k*j);

tic;F*y;toc
