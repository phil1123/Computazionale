function [x,R] = randcauchy(N,ab,pdf)
% [x,R] = randcauchy(N) or [x,R] = randcauchy(N,[]) or 
% [x,R] = randcauchy(N,[-inf inf]) extracts N pseudorandom 
% numbers x from the Cauchy (or Lorentian) pdf 1/(1+x^2)/pi.
% [x,R] = randcauchy(N,ab) works within the interval [ab(1) ab(2)].
% [x,R] = randcauchy(N,ab,pdf) tries to extract from pdf by using
% Cauchy-distributed numbers
% R is the rejection fraction.

narginchk(1,3)
if nargin < 2 || isempty(ab)
    ab = [-inf inf];
end
a = ab(1);
b = ab(2);
ata = atan(a);
d = atan(b)-ata;

if nargin < 3
    x = tan(d*rand(N,1)+ata);
    R = 0;
    return
end

x = zeros(N,1);
j = 1;
R = 0;
while j < N
    y = tan(d*rand+ata);
    if rand < ((1+y^2)/d)*pdf(y)
        x(j) = y;
        j = j+1;
    else
        R = R+1;
    end
end
R = R/(R+N);