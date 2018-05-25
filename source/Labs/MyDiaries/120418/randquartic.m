function [x,R] = randquartic(N,x0,lambda)
% [x,R] = randquartic(N,x0,lambda) extracts N pseudorandom numbers x
% from the pdf proportional to exp(-(x-x0)^2/2-lambda*x^4).
% R is the rejection fraction.

narginchk(1,3)
if nargin < 3
    lambda = 0.1;
end
if nargin < 2
    x0 = 0;
end

x = zeros(N,1);
j = 1;
R = 0;
while j < N
    y = x0 + randn;
    if rand < exp(-lambda*y^4)
        x(j) = y;
        j = j+1;
    else
        R = R+1;
    end
end
R = R/(R+N);
