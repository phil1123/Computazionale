%% Inizializzazione
clc; clear; 

h = 1; % hbar 

N = 100+1;
N = 1000;

xLim = 50;
b = 4;

box = [-xLim xLim];
x = linspace(box(1),box(2),N)';
nb = find(x>b,1);   
mb = find(x>-b,1);  

dx = x(2)-x(1); 

g = squarelattice(N);
K = h^2/2*(g.laplacian/dx/dx); % Cinetica
% K = g.laplacian

% Calcolo autovalori e vettori
V = diag(stepfunction(x,b));
V0 = 4/b^2;

% V = diag(exp(-0.2*x.^2)); % barriera gaussiana

H1 = K + V;
H0 = full(K);

[M1,D1] = eig(H1);
[M0,D0] = eig(H0);

E0 = diag(D0);
E1 = diag(D1);

K0 = sqrt(2*E0);
K1 = sqrt(2*E1);

analyticT = transmission(E1,V0,2*b); %Coefficiente teorico

pdelta = zeros(N,1);
mdelta = zeros(N,1);

for j = 1:N
    
    ym0 = M0(1:mb-1,j);
    ym1 = M1(1:mb-1,j);
    yp0 = M0(1:mb-1,j);
    yp1 = M1(1:mb-1,j);

    pdelta(j) = phdiff(yp0,yp1);
    mdelta(j) = phdiff(ym0,ym1);
    
end

% Delta = mdelta-pdelta;
Delta = pdelta;

T = (sin(Delta)).^2;

figure
plot(K1,[T analyticT])
xlabel('E')
ylabel('Tr.Coeff.')
legend('Experimental','Analytical')
title('Transmission Coefficient')




