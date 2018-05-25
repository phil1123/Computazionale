delta = 0.01;
F = @(t,y) y^2 - y^3;
opts = odeset('RelTol',1.e-4);
ode23s(F,[0 2e5],1e-5,opts);
