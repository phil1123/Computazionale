function [tout,yout] = odesymp(F,tspan,y0,arg4,varargin)
%ODESYMP  Solve non-stiff differential equations.  Textbook version of ODE23.
%
%   ODESYMP(F,TSPAN,Y0) with TSPAN = [T0 TFINAL] integrates the Hamiltonian 
%   system of differential equations dy/dt = f(t,y) from t = T0 to t = TFINAL.
%   The initial condition is y(T0) = Y0.
%   With respect to the Hamiltonian formalism, y = [q,p]
%
%   The first argument, F, is a function handle or an anonymous function
%   that defines f(t,y).  This function must have two input arguments,
%   t and y, and must return a column vector of the derivatives, dy/dt.
%
%   With two output arguments, [T,Y] = ODESYMP(...) returns a column 
%   vector T and an array Y where Y(:,k) is the solution at T(k).
%
%   With no output arguments, ODESYMP plots the emerging solution.
%
%   ODESYMP(F,TSPAN,Y0,RTOL) uses the relative error tolerance RTOL
%   instead of the default 1.e-3.
%
%   ODESYMP(F,TSPAN,Y0,OPTS) where OPTS = ODESET('reltol',RTOL, ...
%   'abstol',ATOL,'outputfcn',@PLOTFUN) uses relative error RTOL instead
%   of 1.e-3, absolute error ATOL instead of 1.e-6, and calls PLOTFUN
%   instead of ODEPLOT after each successful step.
%
%   More than four input arguments, ODESYMP(F,TSPAN,Y0,RTOL,P1,P2,...),
%   are passed on to F, F(T,Y,P1,P2,...).
%
%   ODESYMP uses the Symplectic Midpoint Euler rule
%
%   Example    
%      tspan = [0 2*pi];
%      y0 = [1 0]';
%      F = @(t,y) [0 1; -1 0]*y;
%      odesymp(F,tspan,y0);

%-------------------------------------------------------------------------%

% Initialize variables.

rtol = 1.e-3; 
atol = 1.e-6;
plotfun = @odeplot;

% Controlli su argomenti input
if nargin >= 4 && isnumeric(arg4)
   rtol = arg4;
elseif nargin >= 4 && isstruct(arg4)
   if isfield(arg4,'RelTol') && ...
           ~isempty(arg4.RelTol), rtol = arg4.RelTol; end
   if isfield(arg4,'AbsTol') && ...
           ~isempty(arg4.AbsTol), atol = arg4.AbsTol; end
   if isfield(arg4,'OutputFcn') && ...
           ~isempty(arg4.OutputFcn), plotfun = arg4.OutputFcn; end
end

t0 = tspan(1); tfinal = tspan(2);
tdir = sign(tfinal - t0); % direzione temporale (permette tfin < tiniz)

plotit = (nargout == 0); % controllo per plottare se non chiamo output
threshold = atol / rtol; % imposta una soglia
hmax = abs(0.1*(tfinal-t0));

t = t0;
y = y0(:); % vettore colonna
q = y(1);
p = y(2);

% Initialize output.

if plotit
   plotfun(tspan,y,'init');
else
   tout = t;
   yout = y.'; % yout = [q,p]
end

% Compute initial step size.

r = norm( F(t, y, varargin{:})./max(abs(y),threshold),inf) + realmin;
h = tdir*0.8*rtol^(1/3)/r;
dh = h;

% ---------------------------- Main loop ---------------------------------%

while t ~= tfinal
  
   hmin = 16*eps*abs(t);
   if abs(h) > hmax, h = tdir*hmax; end
   if abs(h) < hmin, h = tdir*hmin; end
   
   % Stretch the step if t is close to tfinal.

   if 1.1*abs(h) >= abs(tfinal - t)
      h = tfinal - t;
   end
   
   % Attempt a step. 
    tnew = t + h;
    qmid = q + 0.5*h*p; % midpoint
    
    % a = [dq/dt, dp/dt] è la Forza (derivata del potenziale)
    a = F(tnew,[qmid, p],varargin{:}); % punto medio, primo metodo
    a0 =  F(tnew,[q,p],varargin{:});   % punto inziale, primo metodo
    
    % symplectic step midpoint + trapezoid
    % sto supponendo lo stesso punto iniziale q,p per entrambi i metodi
    pnew = p + h*a(2);
    qnew = qmid + 0.5*h*p;        % midpoint
    qalt = q + h.*p + 0.5.*h.^2*a0(1);  % trapezoid
    
    ynew = [qnew,pnew];
        
    a2 = F(tnew,[qalt,p],varargin{:}); % punto finale, secondo metodo

    % Error estimate
    
    % scelgo come stima dell'errore il modulo della differenza tra p e q
    % rispetto ai due algoritmi symplectic midpoint e symplectic trapezoid
    % eq = abs( Qmidpoint - Qtrapezoid);
    % ep = abs( Pmidpoint - Ptrapezoid);
    % osservo che l'errore su q è di ordine h^2, mentre su p è di ordine h

    eq = max( abs( 0.5*h^2*(a-a2) ) );       % Error on q
    ep = max( abs( h*(a - 0.5*(a2+a0) ) ) ); % Error on p
    
    e = max(eq,ep);  
    err = norm(e./max(max(abs(y),abs(ynew)),threshold),inf) + realmin;
      
   % Accept the solution if the estimated error is less than the tolerance.

   if err <= rtol
      t = tnew;
      p = pnew; % Uso per i calcoli
      q = qnew; % Uso per i calcoli
      y = ynew; % Va nell'output
      if plotit
         if plotfun(t,y','')
            break
         end
      else
         tout(end+1,1) = t;
         yout(end+1,:) = y.';
      end
   end
   
   % Compute a new step size.
   h = h*min(5,0.8*(rtol/err)^(1/3));
 
   % Exit early if step size is too small.  
   if abs(h) <= hmin
      warning('Step size %e too small at t = %e.\n',h,t);
      t = tfinal;
   end
end

if plotit
   plotfun([],[],'done');
end

