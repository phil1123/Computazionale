% INVEST.  $100 at 6 percent over 10 years.

y0 = 100;
r = 0.06;
t = 10;

% Euler yearly
h = 1;
y = y0;
for k = 1:t/h
   y = y + h*r*y;
end
yearly = y;

% Euler monthly
h = 1/12;
y = y0;
for k = 1:t/h
   y = y + h*r*y;
end
monthly = y;

% Implicit Euler yearly
h = 1;
y = y0;
for k = 1:t/h
   y = y/(1 - h*r);
end
iyearly = y;

% Implicit Euler montly
h = 1/12;
y = y0;
for k = 1:t/h
   y = y/(1 - h*r);
end
imontly = y;

% Midpoint rule
y = y0;
for k = 1:t/h
   s1 = r*y;
   s2 = r*(y + h/2*s1);
   y = y + h*s2;
end
midpoint = y;

% Trapezoid rule
y = y0;
for k = 1:t/h
   s1 = r*y;
   s2 = r*(y + h*s1);
   y = y + h*(s1+s2)/2;
end
trapezoid = y;

% BS23
y = y0;
s4 = r*y;
for k = 1:t/h
   s1 = s4;
   s2 = r*(y + h*s1/2);
   s3 = r*(y + 3*h*s2/4);
   y = y + h/9*(2*s1+3*s2+4*s3);
   s4 = r*y;
end
bs23 = y;

% Compound continuously
continuous = exp(r*t)*y0;

interest = {'yearly'; 'monthly'; 'iyearly'; 'imontly'; 'midpoint'; 'trapezoid'; 'bs23'; 'continuous'};
value = [yearly; monthly; iyearly; imontly; midpoint; trapezoid; bs23; continuous];
table(interest,value)
