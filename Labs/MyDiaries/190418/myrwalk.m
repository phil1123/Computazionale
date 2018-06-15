% myrwalk   Two-dimensional random walk.
%   What is the expansion rate of the cloud of particles?

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

shg
clf
set(gcf,'menu','none','numbertitle','off','name','Brownian')
nmax = 10e4;
N = 10000;
delta = .002;
x = zeros(N,3);
adx = [];
dax = [];
Mdx = [];  
h = plot3(x(:,1),x(:,2),x(:,3),'.');
axis([-1 1 -1 1 -1 1])
axis square
stop = uicontrol('style','toggle','string','stop');

n = 0;
while get(stop,'value') == 0 && n <= nmax
   x = x + delta*randn(size(x));
   adx = [adx mean(sqrt(sum(x.^2,2)))];
   dax = [dax norm(x(:))/sqrt(N)]; %questo fa la radice della somma (scamio operazioni)
   Mdx = [Mdx max(sqrt(sum(x.^2,2)))];
   set(h,'xdata',x(:,1),'ydata',x(:,2),'zdata',x(:,3))
   drawnow
   n = n+1;
end
set(stop,'string','close','value',0,'callback','close(gcf)')
