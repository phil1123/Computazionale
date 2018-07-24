%% Inizializzazione
clc; clear; 

h = 1; % hbar 

N = 1000;

xLim = 50;
b = 4;

box = [-xLim xLim];
x = linspace(box(1),box(2),N)';
nb = find(x>b,1);   
mb = find(x>-b,1);  

dx = x(2)-x(1); 

g = squarelattice(N);
L = h^2/2*(g.laplacian/dx/dx); % Cinetica
% L = g.laplacian

% Calcolo autovalori e vettori
V = diag(stepfunction(x,b));
V0 = 4/b^2;

% V = diag(exp(-0.2*x.^2)); % barriera gaussiana

H = L + V;
H0 = full(L);

[M,D] = eig(H);
[M0,D0] = eig(H0);

E0 = diag(D0);
E = diag(D);

K0 = sqrt(2*E0);
K = sqrt(2*E);

analyticT = transmission(E,V0,2*b); %Coefficiente teorico

[teta_r,teta_l] = fase(x,M,K,mb,nb);

%%
% plot((teta_r-teta_l) ./K)

plot(K(i),teta_r(i)-teta_l(i))

T = sin(teta_r-teta_r).^2;
T = sin(K).^2;

plot(1-sin(K).^2./K.^2)

plot(T)