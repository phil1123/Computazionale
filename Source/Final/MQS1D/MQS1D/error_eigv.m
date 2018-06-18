% ERRORS IN THE EIGENVALUES
% This part of the program wants to give some information about the
% possible computational errors during the calculation of the eigenvalues
% of a given potential.
% To illustrate the errors the program comapares the computet solution of 
% Harmonic Oscillator with the analitic solution.
% There are many possible causes for the errors:

% FIRST: The most important is the interval in which is defined V, if you
% define a potential in an interval I and it as a maximum in that interval
% the eigenvalues will be correct until their values will be near the
% maximum of the potential because the matrix H doesn't know how the
% potential is out of that interval.
% So the correctness of the eigenvalues depends vary strong from the
% interval definiton of the potential.

% SECOND: The approximation of the Laplacian is the first order, because 
% the matrix that approximate it in the discrete space takes into account 
% only the first values to the right and left of the point in which the 
% laplacian is calculated. This mean that the error on the eigenvalues is
% at least of 1e-2. To decrease the error we can decrease the step size
% 'a' ( so we can increase N ).

%% FIRST (Importance of the interval of definition of V)
% Note that for a given interval, a fixed N so a fixed 'a', the solution
% using the simplest approximation of the laplacian operator in finite
% space gives an error on the eigenvalues.
N = 1024;
x = linspace(-10, 10, N);
a = x(2) - x(1);
% Potential
V = x.^2/2;
% Laplacian
L = lap1D(N, a);
% True En
Ee = (0:N)' + 1/2;
% H
H = -0.5*L + sparse(diag(V));
% Compute eigenvalues
% Set the option for the eigs function
opts.isreal = 1;   
opts.issym = 1;     
Num_Eig = N-1;       
E = eigs(H, Num_Eig, 'SA', opts);
% Plot ALL the solution
subplot(2,2, [1,2])
plot(0:N-2, Ee(1:N-1), 0:N-2, E(1:N-1))
xlim([0 N-2])
legend('E(n) Exact', 'E(n) Computed')
% Plot the eigenvalues near the maximum of the potential
subplot(2,2, [3,4])
plot(0:60, Ee(1:61), 0:60, E(1:61))
xlim([0 60])
legend('E(n) Exact', 'E(n) Computed')
% From the two plot we can see that until we are in a range of E ~ 50 the
% computed result is match with the exact result

%% SECOND (Dependence of the errors from N)
% We now plot the error dependence of some eigenvalues to different N
% Eigenvalues to analyze
n = [1, 15, 25, 40];
N = [64 128 256 512 1024 2048 4096];
% Save E
E = cell(1, length(n));
Num_Eig = 50;
p = 1;
for i = N
    x = linspace(-10, 10, i);       % Redefine x
    a = x(2) - x(1);
    V = x.^2/2;                     % Potential
    L = lap1D(i, a);                % Laplacian
    H = -0.5*L + sparse(diag(V));   % H
    E_ = eigs(H, Num_Eig, 'SA', opts);
    
    q = 1;
    for j = n
        E{1, q}(p) = E_(j);
        q = q + 1;
    end
    
    p = p + 1;
end
%% Plot the results
subplot(2, 2, 1)
loglog(N, abs(E{:,1} - Ee(1)), 'o')
title('Plot error of E(1) for different N')
xlabel('log(N)')
ylabel('log(err)')
grid on

subplot(2, 2, 2)
loglog(N, abs(E{:,2} - Ee(15)), 'o')
title('Plot error of E(15) for different N')
xlabel('log(N)')
ylabel('log(err)')
grid on

subplot(2, 2, 3)
loglog(N, abs(E{:,3} - Ee(25)), 'o')
title('Plot error of E(25) for different N')
xlabel('log(N)')
ylabel('log(err)')
grid on

subplot(2, 2, 4)
loglog(N, abs(E{:,4} - Ee(40)), 'o')
title('Plot error of E(40) for different N')
xlabel('log(N)')
ylabel('log(err)')
grid on

% From this plot we can note that if we increse N the error decrease, for
% example in E(1) we arrive to have a precision of 1e-8, but if we look to
% E(40) for low N the result is not exact.
% So in QMS1D you can change N if you want to have an accurate result BUT
% it will take a longer time to compute the solution, by default N is set
% to 2048.
% Infact the algotithm uses the function eigs to compute the eigenvalues
% because it use sparse matrix and for N large this algorithm is more
% efficient of eig function that considers the matrix full.