function [x,k] = bisect(f,ab,b)

narginchk(2,3)
kmax = 1e4;
a = ab(1);
if nargin == 2
    b = ab(2);
end
k = 0;
while abs(b-a) > eps*abs(b) && k < kmax
    x = (a + b)/2;
    if f(x) == 0
        return
    elseif sign(f(x)) == sign(f(b))
        b = x;
    else
        a = x;
    end
    k = k + 1;
end