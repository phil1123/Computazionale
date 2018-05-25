function [res,z] = expfitfun(lambda,t,y,h)
% EXPFITFUN Exponential fit function, textbook version
%   [res,z] = expfitfun(lambda,t,y,h) produces a exponential fit
%   with decay rates lambda(j), the independent variable t and
%   the dependent variable y. h is the graphics handle. It returns
%   the norm of the residual (res) and the fitted values (z);
m = length(t);
n = length(lambda);
X = zeros(m,n);
for j = 1:n
    X(:,j) = exp(-lambda(j)*t);
end
beta = X\y;
z = X*beta;
res = norm(z-y);
set(h(2),'ydata',z);
set(h(3),'string',sprintf('%8.4f %8.4f',lambda));
pause(.25);
return