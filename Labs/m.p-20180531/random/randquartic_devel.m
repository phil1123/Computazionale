function [x,R] = randquartic_devel(N,lambda)
% [x,R] = randquartic_devel(N,x0,lambda) extracts N pseudorandom numbers x
% from the pdf proportional to exp(+x^2/2-lambda*x^4).
% R is the rejection fraction.

narginchk(1,2)
if nargin < 2
    lambda = 0.1;
end

x = zeros(N,1);
j = 1;
R = 0;
while j < N
    y = randn;
    if rand < exp(y^2-lambda*y^4-1/4/lambda)
        x(j) = y;
        j = j+1;
    else
        R = R+1;
    end
end
R = R/(R+N);   
    