function y = stepfunction(x,a,V0)
if nargin >= 3
    V = V0;
elseif nargin < 3
     a = 1;
     V = 4/a^2;
end
y = V*(heaviside(x+a) - heaviside(x-a));