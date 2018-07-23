%% init simulation space
% disp('Insert max time (0 = default)')
nt = input('Insert max time (0 = default): ');
if nt==0
    nt=100;
end
N = 1000;
%N = 1023;  % 2^m-1 to use dst() below
L = 56;
mybox = [-L L];
x = linspace(mybox(1),mybox(2),N)';
dx = x(2)-x(1); 
g = squarelattice(N);
L = g.laplacian/dx/dx;
% wavenumbers and khat's
n = floor(N/2);
nn = floor((N-1)/2);
k = (2*pi/(dx*N))*(-n:nn)';
khat = (2/dx)*sin((pi/N)*(0:N-1)');
khatd = (2/dx)*sin((pi/(N+1)/2)*(1:N)'); % for Dirichlet bc
%L(1,N) = 0; L(N,1) = 0; % Dirichlet bc

%% init vars and plot

%%% POTENZIALI
Yscaling = 1/2;
Xscaling = 1;

% Altro
% V = 0.25*x.^4;
% V = 0.5*x.^2;

% Gaussiano
V = 2*exp(-0.5*x.^2);

% % Scalino
% b = 20;
% V = zeros(N,1);
% V0 = 4/b^2;
% V0 = 1;
% V(N*0.5-b:1:N*0.5+b) = V0;
% Yscaling = 1/V0;

% Hamiltoniana
H = L + V;
[M,D]= eig(H);

%%% DATO INIZIALE
% Gaussiano
x0 = 15; % Traslazione
sigma = 0.05; % Varianza gaussiana

psi = exp(-(x-33.5).^2/sigma);
psi = psi/(sqrt(dx)*norm(psi));

% Autostato di H
% psi = M(:,1); %Primo autostato
% psi = psi/(sqrt(dx)*norm(psi));
% 
plot(Xscaling*x,Yscaling*V)
axis([mybox(1) mybox(2) -1 1.25])

hold on
box on
h = plot(x,real(psi));
% kpsi = sfft(psi);
% h = plot(x,s*real(kpsi));
% axis([-1 1 -1 1])
grid
nplot = 2;

%% init run
kk = fftshift(k);
%kk = khat;
%kk = khatd;
dt = 0.01;
%dt = -1i*0.01;
% nt = 10000;
% nt = 1000;
% nt = 2;
upsi = psi;
%upsi = conj(upsi);

%% run

for j = 1:nt
    %upsi = upsi - (dx*psi0'*upsi)*psi0;
    upsi = exp(-1i*dt*V/2).*upsi;
    upsi = ifft(exp(-1i*dt*kk.^2/2).*fft(upsi));
    %upsi = idst(exp(-1i*dt*kk.^2/2).*dst(upsi));
    %upsi = sinft(exp(-1i*dt*kk.^2/2).*sinft(upsi));
    upsi = exp(-1i*dt*V/2).*upsi;
    %upsi = upsi/(sqrt(dx)*norm(upsi));
    if mod(j,nplot) == 0
        set(h,'Ydata',abs(upsi));
        set(h,'Xdata',Xscaling*x);
        %set(h,'Ydata',real(upsi));
        %kpsi = sfft(upsi);
        %set(h,'Ydata',real(kpsi));
        drawnow
        %pause(0.2)
    end
end
%%
x0 = find(x>0);
U = abs(upsi);
T = sum(U(1:x0))./sum(U(1:N))