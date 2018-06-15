function Y = simpletest(y,~)

n = length(y);
omega = exp(-2*pi*1i/n);

if nargin == 2 || mod(n,2) ~= 0
    Y = zeros(n,1);
    for j = 0:n-1
        for k = 0:n-1
            Y(j+1) = Y(j+1) + omega.^(j*k)*y(k+1);
        end
    end
    return
end

k = (0:n/2-1)';
w = omega .^ k;
u = simpletest(y(1:2:n-1));
v = w.*simpletest(y(2:2:n));
Y = [u+v; u-v];