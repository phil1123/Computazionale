function [H,x,Htri] = dqharmosc(nx,om,~)
% [H,x,Htri] = dqharmosc(nx,om) returns the "best" Hamiltonian matrix H and
% the corresponding 1D grid x and tridiagonal approximation Htri of the 
% discrete quantum harmonic oscillator.
% If nx is a negative integer, Dirilichet rather than periodic b.c. are assumed.
% If nargin == 0 || nargin == 3 a figure is opened with a plot of the
% two spectra.
% Example calls:  dqharmosc;
%                 dqharmosc(-600,2.5);
%                 H = dqharmosc(1024,2.5,[]);

if nargin < 2
    om = 1;
end
if nargin < 1
    nx = 1024;
end
if ~(isscalar(nx) && round(nx) == nx)
    error('first input must be a integer scalar')
end
if ~(isscalar(om) && isreal(om))
    error('second input must be a real scalar')
end
if nx == 0
    H = []; x= []; Htri = [];
    return;
end

pflag = nx > 0;
nx = abs(nx);

if nx < 2
    H = []; x= []; Htri = [];
    return;
end

x = -(nx-1)/2:(nx-1)/2;
n = floor(nx/2);
nn = floor((nx-1)/2);
k = (2*pi/nx)*(-n:nn)';

maxT = max(k.^2/2);  % by construction, this is just pi^2/2
maxV = 0.5*(om*nx/2)^2;
dx = (maxT/maxV)^(1/4); % "optimal" lattice spacing
x = x'*dx;
k = fftshift(k/dx);

if pflag
    T = ifft(diag(k.^2/2)*fft(eye(nx)));
else
    k = (pi/dx/(nx+1))*(1:nx)';
    T = sinft(diag(k.^2/2)*sinft(eye(nx)));
end
        
T = real(T+T')/2;
V = 0.5*om^2*x.^2;
H = T + diag(V);

wantplot = 0;
if  nargin == 0 || nargin == 3
    wantplot = 1;
end

if  nargout == 3 || wantplot
    a = diag(ones(nx-1,1),1);
    if pflag
        a(nx,1) = 1;
    end
    Htri = (eye(nx) - (a+a')/2)/dx/dx + diag(V);
end

if  wantplot
    figure
    [~,E] = eig(H);
    [~,Etri] = eig(Htri);
    plot(diag(E))
    hold
    plot(diag(Etri))
    legend('H spectrum','Htri spectrum','Location','northwest')
end