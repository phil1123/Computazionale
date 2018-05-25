function [y,yy] = gammalninv(x)
% Inverse of log gamma function.
% x must be > x0 = -.12148629053584960809551455717769
% y = gammalninv(x) computes y so that gammaln(y) = x, returning
% the outer value y > y0 = 1.4616321449683623412626595423257.
% [y,yy] = gammalninv(x) returns also the inner value yy < y0.
%
% y0 is the minimum of gammaln(y) and is computed as follows:
% syms x; assume(x>0); y0 = solve(psi(x)==0,x);
% then x0 = log(gamma(y0)).

x0 = double(-.12148629053584960809551455717769);
y0 = double(1.4616321449683623412626595423257);
y = zeros(size(x));
yy = zeros(size(x));
n = length(x(:));

for k = 1:n
    if x(k) < x0
        warning(['Function undefined for x < ' sprintf('%.15f',x0)])
        y(k) = NaN;
        yy(k) = NaN;
    end
end

for k = 1:n
    if x(k) >= x0
        y(k) = fzero(@(y)gammaln(y)-x(k),[y0 x(k)+5]);
    end
end

if nargout == 2
    for k = 1:length(x(:))
        if x(k) >= x0
            if x(k) < 0
                yy(k) = fzero(@(y)gammaln(y)-x(k),[1 y0]);
            else
                z = fzero(@(z)gammaln(1+exp(-z))+z-x(k),[0 x(k)]);
                yy(k) = exp(-z);
            end
        end
    end
end  
  
