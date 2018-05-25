function es_3_14

% Esercizio 3.14

clear;clc;

% Definizione variabili 
x = [-1.00 -0.96 -0.65 0.10 0.40 1.00];
y = [-1.0000 -0.1512 0.3860 0.4802  0.8838 1.0000];

u = [-1:0.01:1];                            %asse x con incremento di 0.1

%--------------------------------------------------------------------------

disp('(a) Modify splinetx so that it forms the full tridiagonal matrix');
disp('and use backslash to compute the slopes');
disp(' ');
disp('VEDI CODICE');

[v,A]=mysplinetx(x,y,u); 
% per comodità, faccio restituire alla funzione anche la matrice A che
% usa per risolvere il sistema, così la posso usare dopo nel punto (b)

hline;

%--------------------------------------------------------------------------

disp('(b) Monitor condest(A) as the spline knots are varied with interpgui.');
disp('What happens if two of the knots approach each other?');
disp(' ');
disp('Dal dataset iniziale, condest(A) vale:');
  
condest(A)

% Recall: condest dà un limite inferiore al numero di condizionamento in
% norma 1 della matrice

disp('Osservo che, con interpgui, il numero di condizionamento aumenta'); 
disp('se i dati presentano forti variazioni, in intervalli ristretti.'); 
disp('Questo perchè dovendo mantenere la derivata seconda continua');
disp('l''algoritmo trova difficoltà ad interpolare');
disp('utilizzando matrici well-conditioned.');
disp(' ');
disp('Find a data set that makes condest(A) large.');
disp(' ');
disp('Un esempio di dataset di questo tipo è: ');
disp(' ');
disp('x = [-1.00 -0.96 -0.95 0.94 0.40 1.00]');
disp('y = [-1.0000 -1512 0.3860 4802  0.8838 1.0000]');

disp(' ');
x = [-1.00 -0.96 -0.95 0.94 0.40 1.00];
y = [-1.0000 -1512 0.3860 4802  0.8838 1.0000];
disp(' ');

[v,A]=mysplinetx(x,y,u); 
disp('per i quali condest(A) vale');
condest(A)
  
  function [v,A] = mysplinetx(x,y,u)
%  First derivatives
   h = diff(x);
   delta = diff(y)./h;
   [d,A] = splineslopes(h,delta);           %modificato questa funzione

%  Piecewise polynomial coefficients
   n = length(x);
   c = (3*delta - 2*d(1:n-1) - d(2:n))./h;
   b = (d(1:n-1) - 2*delta + d(2:n))./h.^2;

%  Find subinterval indices k so that x(k) <= u < x(k+1)

   k = ones(size(u));
   for j = 2:n-1
      k(x(j) <= u) = j;
   end

%  Evaluate spline

   s = u - x(k);
   v = y(k) + s.*(d(k) + s.*(c(k) + s.*b(k)));
   A=A;                                     %restituisce la matrice A
    
%--------------------------------------------------------------------------

   function [d,A] = splineslopes(h,delta)
%  SPLINESLOPES  Slopes for cubic spline interpolation.
%  splineslopes(h,delta) computes d(k) = S'(x(k)).
%  Uses not-a-knot end conditions.

%  Diagonals of tridiagonal system (not edited)

   n = length(h)+1;
   a = zeros(size(h)); b = a; c = a; r = a;
   a(1:n-2) = h(2:n-1);
   a(n-1) = h(n-2)+h(n-1);
   b(1) = h(2);
   b(2:n-1) = 2*(h(2:n-1)+h(1:n-2));
   b(n) = h(n-2);
   c(1) = h(1)+h(2);
   c(2:n-1) = h(1:n-2);
   

%  Right-hand side (not edited)

   r(1) = ((h(1)+2*c(1))*h(2)*delta(1)+ ...
          h(1)^2*delta(2))/c(1);
   r(2:n-1) = 3*(h(2:n-1).*delta(1:n-2)+ ...
              h(1:n-2).*delta(2:n-1));
   r(n) = (h(n-1)^2*delta(n-2)+ ...
          (2*a(n-1)+h(n-1))*h(n-2)*delta(n-1))/a(n-1);

% Matrice tridiagonale
  A = diag(a,-1) + diag(b,0) + diag(c,1); % Definizione matrice
  d = A\r'; % Calcolo di d con \  
end
  
end

% il comando 'hline' plotta una riga orizzontale nella standard output.

  
