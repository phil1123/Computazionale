%% Inizializzazione
clc; clear; 

h = 1; % hbar 

N = 100;

xLim = 50;
b = 5;

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
H1 = K + V;
H0 = full(K);

[M1,D1] = eig(H1);
[M0,D0] = eig(H0);

E0 = diag(D0);
E1 = diag(D1);

K0 = sqrt(2*E0);
K1 = sqrt(2*E1);

analyticT = transmission(E0,V0,2*b); %Coefficiente teorico

%% Plot delle funzioni d'onda
J = 3;

figure
subplot(2,1,1)
y0 = M0(:,J);   
plot(x, y0)
ylim([-0.2 0.2])

grid on

subplot(2,1,2)
y1 = M1(:,J);
plot(x,y1)
ylim([-0.2 0.2])

line([b b],[-0.2 0.2])
line([-b -b],[-0.2 0.2])

grid on

%%

A1 = (M1+M0).^2;
A1 = A1(1:mb,1:N);
A1 = sum(A1);

A2 = M1.^2;
A2 = A2(1:mb,1:N);
A2 = sum(A2);

A3 = M0.^2;
A3 = A3(1:mb,1:N);
A3 = sum(A3);

B1 = 2*cos((K1-K0)*x')';
B1 = B1(1:mb,1:N);
B1 = sum(B1);

B2 = 2*cos((K1+K0)*x')';
B2 = B2(1:mb,1:N);
B2 = sum(B2);

R = (A1-A2-A3-B1)./B2;
% R = A1-A2-A3-B1;
T = 1-R;

figure
subplot(1,2,1)
plot(E0/V0,T,'-r');

xlabel('E/V0')
ylabel('Transmission coefficient')
title('Experimental')

subplot(1,2,2)
plot(E0/V0,analyticT,'-b');

xlabel('E/V0')
ylabel('Transmission coefficient')
title('Analytical')




