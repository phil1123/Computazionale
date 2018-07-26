function [K,T] = tr_coefficient(x,U)
%% Inizializzazione

N = length(x);

dx = x(2)-x(1); 
g = squarelattice(N);          % condizioni di periodicità

L = 0.5*(g.laplacian/dx/dx); % energia cinetica
V = diag(U);

%% autovalori e autovettori

H = L + V;
% [M,D] = eig(H);
D = eig(H);
E = diag(D);
K = sqrt(2*E);

% hamiltoniana libera
% H0 = full(L);
% [M0,D0] = eig(H0);
% E0 = diag(D0);
% K0 = sqrt(2*E0);

%% coefficiente trasmissione
T = sin(2*xLim*K).^2;
 