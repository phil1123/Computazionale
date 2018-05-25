function es_2_18
% Es. 2.18

% instructions from the original code left untouched

nmax = 100;
n = 2:nmax;
kappalo = n.^(1/2);
kappahi = 500*n.^3;

%--------------------------------------------------------------------------

% (a) Modify randncond.m so that the two lines have the same 
% slope and enclose most of the observations.

% From the graph we observe that:
% 1.
% (for each dimension n) the density of points accumulates 
% in the lower region, while observation with higher condition number
% are more or less scattered or spearded
% 2.
% A lower linear bound seems to be more sharply defined along
% the lower edge of the cloud of observations thus, with the aim 
% of obtaining an AVERAGE SLOPE close to the observed linear lower bound
% we collect, for each dimension n, the minimum condesation number in 
% the following vector

minCondN = inf(nmax,1);

% for the purpose being initizialized at Inf.


%-------------------------------------------------------------------------

% (b) Based on this experiment, what is your guess for the exponent p in
% κ(R n ) = O(n p )? How confident are you?

% In order to obtain a measure of uncertainty we repeat the same trick 
% with the maximum 

maxCondN = -inf(nmax,1);

disp('We can interpret the absolute difference');
disp('| averageMinSlope - averageMaxSlope |');
disp('as the width of a confidence interval centered on our best estimate');

shg
clf reset
h = loglog(n,[kappalo; kappahi],'-',nmax,NaN,'.');
set(h(1:2),'color',[0 2/3 0]);
set(h(3),'color','blue')
set(gca,'xtick',[2:2:10 20:20:nmax])

kappamax = 1.e6;
axis([2 nmax 2 kappamax])
stop = uicontrol('pos',[20 10 40 25], ...
   'style','toggle','string','stop','value',0);
hold on

while (get(stop,'value') ~= 1)
   N = ceil(rand*nmax);
   A = randn(N,N);
   kappa = condest(A);
   loglog(N,kappa,'.','color','blue')   
   drawnow
   
   % for each dimension we get the lowest condition number
   if ( kappa < minCondN(N) ) 
       minCondN(N) = kappa
   % for each dimension we get the higher condition number
   elseif ( kappa > maxCondN(N) ) maxCondN(N) = kappa
   end
   
end

% the following three instructions clean data-out
minCondN = log(minCondN) ./ log([1:length(minCondN)]')
minCondN = minCondN(abs(minCondN)~=Inf)

maxCondN = log(maxCondN) ./ log([1:length(maxCondN)]')
maxCondN = maxCondN(abs(maxCondN)~=Inf)

% and estimate  AVERAGE SLOPE
averageMinSlope = mean(minCondN(2:end))
averageMaxSlope = mean(maxCondN(2:end))

% now we set the linear bound
line = n.^averageMinSlope;

% and we widen a corridor with the coefficients
high = 0.5;
low  = 10;

h = loglog(n, high.*line ,'+',nmax,NaN,'.');
h = loglog(n,  low.*line ,'+',nmax,NaN,'.');

hold off

set(stop,'val',0,'string','close','callback','close(gcf)')

% (c) The program uses (’erasemode’,’none’), so you cannot print the
% results. What would you have to change to make printing possible?


end
