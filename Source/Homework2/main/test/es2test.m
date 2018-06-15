test = '1';
disp([ 'test ' char(test) ]);

N = 2;
disp([ 'length(w) ' N ]);
s = 1e6;
w = [0.5 0.5];
tol = 1e-3;
x = [0 1];

tic,
[y wu au] = alias(s,w,tol,x);
toc;

f = [sum(y==x(1)) sum(y==x(2))]./s;
discrepancy = norm(f-w,2);

if discrepancy< 1e-3
    disp([ ' ok.']);
else 
    disp([ ' ko ']);
    w
    f
end



test = '2';
disp([ 'test ' char(test) ]);

N = 100;
disp([ 'length(w) ' N ]);
s = 1e6;
w = rand(N,1)'; w = w./sum(w);
tol = 1e-3;
x=1:N;

tic,
[y wu au] = alias(s,w,tol,x);
toc;

f = histc(y,x)'./s;
discrepancy = norm(f-w,2);

if discrepancy< 1e-3
    disp([ ' ok.']);
else 
    disp([ ' ko ']);
    discrepancy
end




test = '3';
disp([ 'test ' char(test) ]);

N = 1000;
disp([ 'length(w) ' N ]);
s = 1e6;
w = 10*randn(N,1)'; w = abs(w)./sum(abs(w));
tol = 1e-3;
x=1:N;

tic,
[y wu au] = alias(s,w,tol,x);
toc;

f = histc(y,x)'./s;
discrepancy = norm(f-w,2);

if discrepancy< 1e-3
    disp([ ' ok.']);
else 
    disp([ ' ko ']);
    discrepancy
end