function [phi_l,phi_r] = fase(x,M,K,mb,nb)

N = size(x,1);
x_r = x(1:mb);
x_l = x(nb:N);

n = size(x_r,1);

phi_l =  zeros(N,1);
phi_r =  zeros(N,1);

for j=2:2:N
    psi = M(1:mb,j);
    y = psi( find(x_r>-2*pi,1) );
    phi_l(j) = acos(y) + K(j)*2*pi;
    
    psi = M(nb:N,j);
    y = psi( find(x_l>2*pi,1) );
    phi_r(j) = acos(y) - K(j)*2*pi;
end

for j=1:2:N
    psi = M(1:mb,j);
    y = psi( find(x_r>-2*pi,1) );
    phi_l(j) = asin(y) + K(j)*2*pi;
    
    psi = M(nb:N,j);
    y = psi( find(x_l>2*pi,1) );
    phi_r(j) = asin(y) - K(j)*2*pi;
end

% plot([phi_l phi_r]);
% title('Fasi teta-,teta+ contro K')
% legend('teta-','teta+')
