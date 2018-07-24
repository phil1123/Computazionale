%% init simulation space
N = 2048;
% N = 1023;  % 2^m-1 to use dst() below
mybox = [-56 56];
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
%%% Potenziale
% V = 0.25*x.^4;
% V = 0.5*x.^2;
% V = zeros(N,1);

% Gaussiano
x0 = 0;
sigma = 1;
V0 = 1;
V = V0*exp(-(x-x0).^2./sigma.^2);

% Gradino

%%%Pacchetto d'onda
x0 = -15;
sigma = 1/2;
psi = exp(-(x-x0).^2./sigma.^2);
psi = psi/(sqrt(dx)*norm(psi));

clf
s = 0.005;
plot(x,s*V)
axis([mybox(1) mybox(2) -1 1.25])
hold on
box on
h = plot(x,real(psi));
%kpsi = sfft(psi);
%h = plot(x,s*real(kpsi));
%axis([-1 1 -1 1])
grid
nplot = 2;

%% init run
kk = fftshift(k);
%kk = khat;
%kk = khatd;
dt = 0.01;
%dt = -1i*0.01;
nt = 10000;
upsi = psi;
%upsi = conj(upsi);

%% run
for j = 1:nt
    %upsi = upsi - (dx*psi0'*upsi)*psi0;
    upsi = exp(-1i*dt*V/2).*upsi;
    upsi = ifft( exp(-1i*dt*kk.^2/2).*fft(upsi) );
    %upsi = idst(exp(-1i*dt*kk.^2/2).*dst(upsi));
    %upsi = sinft(exp(-1i*dt*kk.^2/2).*sinft(upsi));
    upsi = exp(-1i*dt*V/2).*upsi;
    %upsi = upsi/(sqrt(dx)*norm(upsi));
    if mod(j,nplot) == 0
        set(h,'Ydata',abs(upsi));
        %set(h,'Ydata',real(upsi));
        %kpsi = sfft(upsi);
        %set(h,'Ydata',real(kpsi));
        drawnow
        %pause(0.2)
    end
end