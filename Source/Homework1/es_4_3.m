function es_4_3

% Es. 4.3

clear; clc;


disp('4.3. Here is a cubic polynomial with three closely spaced real roots:')
coeff = [ 816 -3835 6000 -3125 ];
sprintf('%d x^3  %d x^2 + %d x %d', coeff(1),coeff(2),coeff(3),coeff(4))
hline;

%-------------------------------------------------------------------------

disp('(a) What are the exact roots of p?');

disp('Roots found with function roots');
rootsFound = roots(coeff)

hline;

%------------------------------------------------------------------------

disp('(b) Plot p(x) for 1.43 ≤ x ≤ 1.71. Show the location of the three roots.');

xInf = 1.43; 
xSup = 1.71; 
step = 1/1000;
x = xInf:step:xSup;
order = size(coeff,2);

y = coeff(1)*x.^3 + coeff(2)*x.^2 + coeff(3)*x + coeff(4);
graph = plot(x, y, 'k-');
line([xInf xSup],[0 0],'Color', 'k');
axis auto;
xlim([xInf xSup]);
ylim([-0.6 0.6]);
hold on;
r0 = plot(rootsFound(1), 0,'ko',rootsFound(2), 0,'ko',rootsFound(3), 0,'ko');

disp('Plotted');
hline;

%--------------------------------------------------------------------------

disp('(c) Starting with x0 = 1.5, what does Newton’s method do?');
disp('');
disp('at x=1.5 slope is negative: first step turns back significantly');
disp('toward zero, then increases monotonically toward the smaller root');


f = @(x) coeff(1)*x^3 + coeff(2)*x^2 + coeff(3)*x + coeff(4);
fprime = @(x) 3*coeff(1)*x^2 + 2*coeff(2)*x + coeff(3);

xprev = 0;
x=1.5;     % starting condition

k = 0;
MAX_ITER = 1000;
while abs(x - xprev) > eps*abs(x) && k < MAX_ITER
xprev = x;
x = x - f(x)/fprime(x);
r1 = plot(x,0, 'Marker','+', 'Color', 'blue');
k = k + 1;
end

newtonRoot = x

hline;

%--------------------------------------------------------------------------

disp('(d) Starting with x0 = 1 and x1 = 2, what does the secant method do?');

disp('  ');
disp('the secant intersect the x-axis close to 1.7 which is greater than');
disp('the the third root, which is approached monotonically from the right.');


MAX_ITER = 100000;
a = 1;
b = 2;

while abs(b-a) > eps*abs(b)  && k < MAX_ITER
c = a;
a = b;
b = b + (b - c)/(f(c)/f(b)-1);
k = k + 1;
r2 = plot(b,0, 'Marker','+', 'Color', 'red');
end

secantRoot = b

%--------------------------------------------------------------------------

disp('(e) Starting with the interval [1, 2], what does bisection do?');
disp('  ');
disp('the first half of the interval x = 1.5 has a positive image');
disp('such that f(1.5) < f(2): the algorithm take thus the left half');
disp('and continue toward the first root alternating steps from the right and the left.');
disp('  ');

MAX_ITER = 100000;
k = 0;
a = 1;
b = 2;

while abs(b-a) > eps*abs(b)  && k < MAX_ITER
x = (a + b)/2;
if sign(f(x)) == sign(f(b))
b = x;
else
a = x;
end
k = k + 1;
r3 = plot(x,0, 'Marker','+', 'Color', 'green');
end

bisectionRoot = b

% Plot legend
legend([graph; r0(1); r1(1); r2(1); r3(1)],'P(x)','Roots','Newton algorithm', 'Secant algorithm','Bisect Algorithm');

%--------------------------------------------------------------------------

disp('(f) What is fzerotx(p,[1,2])? Why?')
disp('');
disp('The algorithm returns the third biggest root because it uses the');
disp('secant method untill the approximation is good enough.');
disp('Then it uses IQI to fine tune with rapid convergence.');

fzerostxRoot = fzerotx(f,[1,2])

end

% il comando 'hline' plotta una riga orizzontale nella standard output.
