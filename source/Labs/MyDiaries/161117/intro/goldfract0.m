function  [ps,pf,pv,err] = mygoldfract(n)
%GOLDFRACT   Golden ratio continued fraction.
%  GOLDFRACT(n) displays n terms.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

if nargin < 1
    n = 6;
end

p = '1';
for k = 1:n
   p = ['1+1/(' p ')']; %#ok<AGROW>
end
ps = p;
%disp(['p = ', p])

p = 1;
q = 1;
for k = 1:n
   s = p;
   p = p + q;
   q = s;
end
p = sprintf('%d/%d',p,q);
%disp(['p = ', p])
pf = p;

p = eval(p);
%disp(['p = ', sprintf('%1.15f',p)])
pv = p;

err = (1+sqrt(5))/2 - p;
%disp(['err = ', sprintf('%1.5g',err)])
