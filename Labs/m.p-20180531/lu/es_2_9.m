function es_2_9
% Es. 2.9 Singular system.

A = [1 2 3; 4 5 6; 7 8 9]; 
b = [1; 3; 5];

%(a) 
disp('p = [1/3; 1/3; 0] is a particular solution.')
p = [1/3; 1/3; 0];
isequal(A*p,b)
z = null(A,'r')
disp('is a null vector.')
disp('Therefore, for a free parameter t, x = p + t*z is the general solution.')

%(b) 
% Elimination with exact arithmetic would produce U(3,3) = 0 and c(3) = 0, so
% back substitution would start with x(3) = 0/0. This arbitary value corresponds
% to the free parameter t.

%(c) 
x = bslashtx(A,b) % = [13/3; -23/3; 4]
% dbstop in bslashtx/backsubs shows that back substitution begins with
% x(3) = y(3)/U(3,3) = (2/eps)/(eps/2) = 4.
% This is a good solution because the residual, r = b - A*x, is small. 
% This is a bad solution because bslashtx does not give any warning that
% the solution is not unique, and that the error, e = x - inv(A)*b, is 
% not even defined.

%(d) 
x = A\b % = [17/6; -14/3; 5/2]
% The builtin backslash operator does the arithmetic in a different order, 
% using a column-oriented algorithm where bslashtx uses a row oriented 
% algorithm. The back substitution starts with
% x(3) = x(3)/U(3,3) = (5/4*eps)/(eps/2) = 5/2
% The different values of x(3) obtained by the different algorithms 
% correspond to different values of the free parameter t in the 
% theoretical general solution.