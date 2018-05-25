function [t,y] = chute(K1,K2)
% Paratrooper problem.
g = 9.81;
K = K1;
M = 80;
y0 = 600;
y0p = 0;

[t,y] = ode23(@chutef,[0 5],[y0; y0p],[],K/M);
y1 = y(end,1);
y1p = y(end,2);

K = K2;
opts = odeset('events',@gstop);
[t2,y2,tf,yf] = ode23(@chutef,[5 inf],[y1; y1p],opts,K/M);
tf
yf
t = [t; t2];
y = [y; y2];

tfree = sqrt(2*y0/g)
yfree = y0 - g/2*t.^2;
yfreef = [0 -g*tfree]

dkgreen = [0 2/3 0];
line(t,y(:,1),'linestyle','-','color','blue')
line(t,yfree,'linestyle',':','color',dkgreen)
line(5,y1,'marker','*','color','black')
line(tf,0,'marker','o','color','black')
text(5.5,y1,sprintf('y(5) = %5.1f',y1))
text(tf,65,sprintf('tf = %5.2f',tf))
text(tf,35,sprintf('y''(tf) = %5.2f',yf(2)))
line(tfree,0,'marker','o','color',dkgreen)
text(7,65,sprintf('tf = %5.2f',tfree))
text(7,35,sprintf('y''(tf) = %5.2f',-g*tfree))
axis([0 18 0 y0])
box on
xlabel('time (s)')
ylabel('height (m)')
title('Paratrooper')

% ------------------------

function ydot = chutef(t,y,KoM) %#ok<INUSL>
g = 9.81;
ydot = [y(2); -g+(KoM)*y(2).^2];


% ------------

function [gs,isterm,direct] = gstop(t,y,KoM)
gs = y(1);
isterm = 1;
direct = [];
