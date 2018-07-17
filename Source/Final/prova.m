%% Inizializzazione
clc; clear; 

h = 1; % hbar 

% N = 10;
 N = 2048;
% N = 8;

xLim = 50;
b = 5;

box = [-xLim xLim];
x = linspace(box(1),box(2),N)';
nb = find(x>b,1);
mb = find(x<b,1);

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

%% Calcolo della differenza di fase prima e dopo la barriera

MS = N-nb;
X = x(1:MS);

fase = zeros(N,1);

for i=1:N
    Y1 = M1(1:MS,i);
    Y2 = M1(nb:nb+MS-1,i);
    fase(i) = phdiffmeasure(Y1,Y2);
end

figure
plot(1:N,fase)
grid on

%% Coefficiente di trasmissione (sbagliato)

T = zeros(N,1);
for i = 1:N
    T(i) = abs( M1(nb,i) - M0(nb,i) ) ./ abs( M1(1,i) - M0(1,i) );
end

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

%% Calcolo coefficiente di trasmissione come 1 - R

A1 = (M1+M0).^2;
A2 = M1.^2;
A3 = M0.^2;

Kn = (K1-K0)*x';
Km = (K1+K0)*x';

for i=1:mb
    f1 = A2 - A3 - A1 - 2*cos(Kn) * 10000;
end

I1 = sum(f1);

for i=1:mb
    f2 = 2*cos(Km);
end

I2 = sum(f2);

R = I1./I2;

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




