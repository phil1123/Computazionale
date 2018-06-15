function [t,y]=lorenzode(rho,tspan)

   sigma = 10;
   beta = 8/3;
   eta = sqrt(beta*(rho-1));
   A = [ -beta    0     eta
            0  -sigma   sigma 
         -eta   rho    -1  ];
   
   % The critical points are the null vectors of A.
   % The initial value of y(t) is near one of the critical points.
   
   yc = [rho-1; eta; eta];
   y0 = yc + [0; 0; 3];
   

   opts = odeset('reltol',1.e-6);
   [t,y]=ode45(@lorenzeqn, tspan, y0, opts, A);


% ------------------------------

function ydot = lorenzeqn(t,y,A)
%LORENZEQN  Equation of the Lorenz chaotic attractor.
%   ydot = lorenzeqn(t,y,A).
%   The differential equation is written in almost linear form.
%      ydot = A*y
%   where
%      A = [ -beta    0     y(2)
%               0  -sigma   sigma 
%            -y(2)   rho    -1  ];

A(1,3) = y(2);
A(3,1) = -y(2);
ydot = A*y;



