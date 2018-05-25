function invf = inverse(fh,N)

narginchk(1,2)
persistent x0 y0
if nargin < 3
    N = 1e5;
end

if isempty(y0) || nargin == 3
    x0 = linspace(0,1,N)';
    y0 = fh(x0);
end

invfi = griddedInterpolant(y0,x0,'pchip');
invf = @(x)invfi(x);