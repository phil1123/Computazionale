function [k,T] = tr_coefficient(x,U)
%% Inizializzazione

N = length(x);
l = max(x);

dx = x(2)-x(1); 
g = squarelattice(N);          % condizioni di periodicità

L = 0.5*(g.laplacian/dx/dx); % energia cinetica
V = diag(U);

%% autovalori e autovettori

H = L + V;
[M,D] = eig(H);
% E = eig(H);
% E = diag(D);
% plot(E)
k = sqrt(2*E);

subplot(1,2,1)
plot(x,M(:,4:2:8))
title('Autostati per k= 2,4,6,8')
xlabel('x')
ylabel('Psi_k')
legend('2','4','6','8')
subplot(1,2,2)
plot(x,M(:,3:2:9))
title('Autostati per k= 3,5,7,9')
xlabel('x')
ylabel('Psi_k')
legend('3','5','7','9')


% hamiltoniana libera
% H0 = full(L);
% [M0,D0] = eig(H0);
% E0 = diag(D0);
% K0 = sqrt(2*E0);

%% coefficiente trasmissione
T = sin(2*l*k).^2;
 