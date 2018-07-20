%% Inizializzazione
clc; clear; 

h = 1; % hbar 

N = 100+1;

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
H1 = K + V;
H0 = full(K);

[M1,D1] = eig(H1);
[M0,D0] = eig(H0);

E0 = diag(D0);
E1 = diag(D1);

K0 = sqrt(2*E0);
K1 = sqrt(2*E1);

analyticT = transmission(E0,V0,2*b); %Coefficiente teorico


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

% figure
% subplot(1,2,1)
% plot(E0/V0,T,'-r');
% 
% xlabel('E/V0')
% ylabel('Transmission coefficient')
% title('Experimental')
% 
% subplot(1,2,2)
% plot(E0/V0,analyticT,'-b');
% 
% xlabel('E/V0')
% ylabel('Transmission coefficient')
% title('Analytical')


%%

Fsymmetric = true;

omega = exp(-2*pi*i/(N-1));
j = -(N-1)/2:(N-1)/2;
k = j';

if (Fsymmetric==true)
    F = omega.^(k*j)/sqrt(N);
else
    F = fft(eye(N))/sqrt(N);
end

% si verifica che hanno gli stessi autovalori
[FM0,FD0] = eig(F*H0*F');
[FM1,FD1] = eig(F*H1*F');
    FE0 = diag(FD0);
    FE1 = diag(FD1);
    [FE0,I0] = sort(FE0);
    [FE1,I1] = sort(FE1);
    
FM0=FM0(:,I0);
FM1=FM1(:,I1);

%% evidenze

% risoluzione della degenerazione: ogni autovalore degenenere viene
% innalzato di un valore positivo delta1 e delta2.

% i delta hanno un andamento a gobba simile a quello del coefficiente di
% trasmissione, T = f(E1-E0)?
deltaAut = [ (1:N)', E0, E1, E1-E0]
plot(E1-E0)

%% Plot delle funzioni d'onda
J = [7:11];

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

% le funzioni d'onda sono periodiche, anche se la peridicità è
% verificabile con approssimazione crescente solo per N grande
M0(1,J)-M0(end,J)

% le funzioni sono dispari per indici pari degli autovalori
plot(M0(:,[2 4]));
plot(M1(:,[2 4]));

% sembra che siano in relazione di differenza di fase 
plot([M1(:,4) M0(:,4)]);

plot((real(F*[M1(:,46) M0(:,46)])));

plot((imag(F*[M0(:,2) M0(:,2)])))


%%

% ottengo gli stessi autovalori
index = 1:5;
d0 = sort(diag(F*H0*F'));
[ (1:N)', E0, d0]


d0 = sort(diag(F*V*F'));
[ (1:N)', E0, d0]

%%

figure



y0 = F*M0(:,3:3)/norm(M0(:,3:3));
y1 = F*M1(:,3:3)/norm(M1(:,3:3));
subplot(2,1,1)
    plot(j, [ real(y0) real(y1)] )
    grid on
    xlim([-10 10])
subplot(2,1,2)
    plot( j, [ imag(y0) imag(y1)] )
    xlim([-10 10])
    grid on
    
%%

mid = 1+ (N-1)/2;

figure
N1 = F*M1;
N0 = F*M0;
a = abs( N1(mid,3:2:N) - N0(mid,3:2:N) );
plot(a)
