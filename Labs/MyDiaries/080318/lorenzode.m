function [t,y] = lorenzode(tspan,rho)

sigma = 10;
beta = 8/3;
eta = sqrt(beta*(rho-1));
A = [ -beta    0     eta; 0  -sigma   sigma; -eta   rho    -1  ];

y0 = randn(3,1);
 
opts = odeset('reltol',1.e-6);
ode45(@lorenzeqn, tspan, y0, opts, A);

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

end

end