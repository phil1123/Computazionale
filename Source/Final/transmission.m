function y = transmission(K,V0,L)
% Transmission coefficient for the square potential barrier
% with heigh V0 and width L. E being the energy

% See Cohen-Tannoudji

if nargin < 2
    V0 = 1;
    L = 1;
end

if ~isscalar(V0)
    error('Potential must be a scalar');
end
if ~isscalar(L)
    error('Box lenght must me a scalar');
end

m = 1; h = 1; % hbar

% x =  E/V0;
x =  K.^2/2/V0;

% if ( any(x(:,1)<0) )
%     error('energies must be positive')
% elseif (0<=x<=1)
if(x<=1)
    y = 4*x.*(1-x) ./ (4*x.*(1-x)+(sinh( sqrt(2*m*L^2*V0/h^2)*sqrt(1-x))).^2);
else
    y = 4*x.*(x-1) ./ (4*x.*(x-1)+(sin( sqrt(2*m*L^2*V0/h^2)*sqrt(x-1))).^2);
end

