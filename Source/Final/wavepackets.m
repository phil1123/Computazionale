%% init simulation space
function [T,k,kk] = wavepackets(T0,~)
% Metodo dei pacchetti d'onda per determinare coefficiente di trasmissione
% per un pacchetto gaussiano con potenziale scelto.
%
% WAVEPACKETS() avvia riproduzione grafica con tempo max default T0 = 10000
% WAVEPACKETS(T0) calcola evoluzione fino a tempo T0, senza grafica
%
% T = WAVEPACKETS() restituisce coefficente di trasmissione alla fine 

gFlag = false; % Flag per avviare la riproduzione grafica
if nargin == 0
    gFlag = true;
    nt = 10000;
else
    nt = T0; % Tempo max di esecuzione
end

N = 1000; % N°punti griglia
L = 1000; % Lunghezza scatola
xl = 0.2; % Scaling lunghezza scatola nel plot

% grid
x = linspace(-L,L,N)';
dx = x(2)-x(1); 

% energia cinetica
% g = squarelattice(N);
% Del2 = g.laplacian/dx/dx;

% wavenumbers per calcolo
% don't break working code
n = floor(N/2);                 % interi k = 2PI/L * n
nn = floor((N-1)/2);            % interi k = 2PI/L * n
k = (2*pi/(dx*N))*(-n:nn)';     % momento coniugato (vettore d'onda)
% k = 5*(2*pi/(dx*N))*(-n:nn)';     % momento coniugato (vettore d'onda)

%% potenziali
ys = 1;   % scaling plot funzione onda asse y
xs = 1;   % scaling plot funzione onda asse x

% Altro
% V = 0.25*x.^4;
% V = 0.5*x.^2;

% Gaussiano
x0 = 0;
sigma = 5;
V0 = 0.5;
V = V0.*exp(-(x-x0).^2./sigma.^2);

% Scalino
% b = 10;
% V0 = 1;
% 
% V = stepfunction(x,b,V0);

%% dato iniziale
% Gaussiano
x0 = -20; % Traslazione
sigma = 1/2; % Varianza gaussiana

psi = exp(-(x-x0).^2/sigma);
psi = psi/(sqrt(dx)*norm(psi));

%% plot
if gFlag == true
    figure
    plot(xs*x,ys*V)       % plot potenziale
%     line([-xl*L xl*L],[max(V) max(V)])
    xlim([-xl*L xl*L])
    ylim([0 1])
    hold on
    box on
    % h = plot(x,real(psi));
    h = plot(x,abs(psi));
    grid
    nplot = 10; % frame da skippare
end

%% init run
kk = fftshift(k); % shift dei k centrandoli
dt = 0.01;
upsi = psi; % funzione d'onda temporale

%% run
% Applicazione evoluzione temporale U = exp(-i*dt*H), applicato nella forma
% U = exp(-i*dt*H) = exp(-i*dt*V/2)exp(-i*dt*T)exp(-i*dt*V/2)
% Inoltre l'operatore T = d^2/dx^2 = p^2 viene fatto agire sulla
% rappresentazione della psi nello spazio dei momenti (in cui è più
% semplice come operatore)
for j = 1:nt
    upsi = exp(-1i*dt*V/2).*upsi;
    upsi = ifft(exp(-1i*dt*kk.^2/2).*fft(upsi)); % T = p^2 = kk^2
    upsi = exp(-1i*dt*V/2).*upsi;
    if gFlag == true
        if mod(j,nplot) == 0
            set(h,'Ydata',abs(upsi));
            set(h,'Xdata',xs*x);
            drawnow
            %pause(0.2)
        end
    end
end

%% transmission
if nargout > 0
    xZero = find(x>0);
    U = abs(upsi).^2;
    T = sum(U(xZero:end))./sum(U(1:N));
end