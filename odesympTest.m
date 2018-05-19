function odesympTest()
% confrontate il comportamento di odesymp.m  e di ode45.m 
% nel caso del pendolo semplice esatto \ddot x = -sin(x).

%-------------------------------- Preamble -------------------------------%
y0 = [1 0];
tspan = [0 2*pi];
% F = @oscillatore;
F = @pendolo;
N = 10;

% Initialize
steps = [0 0];
time = [0 0];
err = [0 0];
tol = 0;

% ------------------------------- Main Loop ------------------------------%
for k = 1:N
    tol(end+1,:) = 10^(-k);
    opts = odeset('reltol',tol(end),'abstol',tol(end),'refine',1);
    tic
    [t,y] = ode45(F,tspan,y0',opts);
    time(end+1,1) = toc;
    steps(end+1,1) = length(t)-1;
    err(end+1,1) = max(abs(y(end,:)-y0));
    
    [t,y] = odesymp(F,tspan,y0',opts);
    tic
    time(end,2) = toc;
    steps(end,2) = length(t)-1;
    err(end,2) = max(abs(y(end,:)-y0));
end

% Plots
figure;
plot(t,y);
title('Moto Pendolo');
legend('Position (q)','Momentum (p)','Location','southeast');

plotcompare(tol,err,steps,time);

end