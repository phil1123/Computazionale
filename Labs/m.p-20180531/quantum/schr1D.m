function [E,setup,x,Psi] = schr1D(setup)
% Schroedinger Operator in 1-D
% The spectrum is computed by sparse matrix methods (Arnoldi)
% and the Kinetic energy is computed in  momentum space.
% The embedded routine "Hamilton" contains the definition of the
% Hamiltonian operator.  Potential is defined in this subroutine 
% and should refer to "x" as a vector, eg. V = x.^2/2 + x.^4
%
% Usage: [E,setup,x,Psi] = schr1D(setup)
% setup is an array which contains
% - omega: parameter in potential energy
% - N: dimension of grid {x_i}
% - L: width of the normalization box (|x|<L)
% - Neig: number of energy eigenvalues returned in output (E)
% - precision (to manage the accuracy of "eigs")
% - disp (verbose = 1, silent = 0)
% - lancz vector=dimension of the Lanczos basis
% Output: E(nergy)=eigenvalues, Psi=eigenfunctions arranged in a
% matrix of dimension N x Neig (first column = ground state).
%
%  E. Onofri, 2008-2012

    if nargin<1,
        setup = initialize();     % setup parameter
    else
        setup = initialize(setup);     % setup parameter
    
    end
% extract parameters converting cells to numbers where appropriate
omega      = str2num(setup{1});
lambda     = str2num(setup{2});
L          = str2num(setup{3});
N          = str2num(setup{4})         ;
Neig       = str2num(setup{5})         ;
prec       = str2num(setup{6})         ;
verbose    = str2num(setup{7})         ;
lancz      = str2num(setup{8})         ;

omsq = omega^2;    

%% -------- space grid ---- notice the normalization 1-1/N
dx = 2*L/N;
x  = -L*(1-1/N) : dx : L*(1-1/N); % symmetrized instead 
x=x';
  
%% -------- momentum grid in Fourier space --
kx  = fftshift(pi*(-N/2:N/2-1)/L)'; 
K2 = kx.^2;	                        

%%      insert the definition of the potential energy here:
% V = omsq * x.^2/2 + lambda*x.^4 + lambda^2*x.^8  ;      % insert V(x) here
V = omsq * abs(x);
% V = omsq*x.^2/2./(1+lambda*x.^2);
% V = omsq*x.^2/2 + lambda*x.^4;
 
%% Eigs options
opts.tol = prec; % to be used by eigs (JacobiSpectrum)
opts.disp = verbose;    % eigs works quietly - alternatively =1 , =2.
opts.isreal = true;
opts.issym  = true;
%opts.v0 = exp(-omega * x'.^2/2.0)';     % initial state to start Arnoldi
opts.p = lancz ;

[Psi,E] = eigs(@Hamilton, N, Neig,'SA',opts);
if ~issorted(E)
    [E,I] = sort(diag(E));
    Psi = Psi(:,I);
else
    E = diag(E);
end


%%--- embedded routines
function Hpsi = Hamilton(psi)
    psixx = real(ifft(K2.*fft(psi)));
    Hpsi  = 0.5* psixx + V .* psi;
end

%%----- setting up parameters via "inputdlg"
function data = initialize(setup)   
% Options
    AddOpts.Resize      = 'on';
    AddOpts.WindowStyle = 'normal';
    AddOpts.Interpreter = 'tex';
   
    entries={'\omega'...                 % first parameter
             '\lambda'...                % second parameter
             'L'...
             'N'...
             'Neig'...
             'precisione'...
             'verbose',...
             'Lancz vectors'
            };
    
    if(nargin<1)
        default={'1',...
                 '0'...
                 '10.0'...
                 '256'...
                 '12'...
                 '1e-8'...
                 '0',...
                 '20'
                };
        
    else
           
        default = setup;                      % reusing a previous setup
    end
    
   
    title='Schroedinger spectrum - 1 dim';
    lines=1;
    data = inputdlg(entries, title, lines, default, AddOpts);
    
end


end

