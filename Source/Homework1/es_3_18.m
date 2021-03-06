function es_3_18

%Es. 3.18

clear; clc;

%-----------------------------------------------------------------------

% Parte a
% (a) If you want to interpolate census data on the interval
% 1900 ≤ t ≤ 2000 with a polynomial,
%    P (t) = c1 t10 + c2t9 + · · · + c10t + c11 
% you might be tempted to use the Vandermonde matrix generated by
%    t = 1900:10:2000  ,  V = vander(t)
% Why is this a really bad idea?

    disp('(a) Reasons to avoid polynomial interpolation:');
    disp(' - instability of estimated coefficients with respect to');
    disp('   little variation in data, may be due to statistical discrepancies');
    disp(' - Vandermonde matrix is bad conditioned');

    t = 1900 : 10 : 2000;
    format short
    fprintf('The condition number is: %.1d', condest( vander(t) ));
    hline;

%-----------------------------------------------------------------------

% Parte b

%(b) Investigate centering and scaling the independent variable.
%Plot some data, pull down the Tools menu on the figure window,
%select Basic Fitting,
%and find the check box about centering and scaling.
%What does this checkbox do?

    disp('(b) Checking the box make the fitting on the scaled and centered x-values');
    disp('with significant effect on the estimated coefficients  ');
    disp('but leaving the norm of the residual unchanged.');

hline;

%-----------------------------------------------------------------------

% Parte c

% (c) Replace the variable t with (t − μ)/s
% This leads to a modified polynomial P̃ (s). How are its coefficients related to
% those of P (t)? What happens to the Vandermonde matrix? What values of
% μ and σ lead to a reasonably well conditioned Vandermonde matrix? One
% possibility is
% mu = mean(t)
% sigma = std(t)
% but are there better values?

    disp('- How are its coefficients related to those of P(t)?');
    disp('  ');
    disp('Consider P̃ (s) = P(t(s)) and symply expand: ');
    disp('P(t(s)) = sums_k ak*(sigma*s + mu)^k ');

    disp('  ');
    disp('- What happens to the Vandermonde matrix?');
    disp('  ');
    disp('Normalizing the independent variable with t = mean');
    disp('and s= standard deviation help the conditioning of the');
    disp('Vandermonde matrix.');
    disp('  ');

    disp('- What μ and σ lead to a reasonably well conditioned Vandermonde?');
    disp('Are there better values than mu = mean(t), sigma = std(t)?');
    x = -50 : 10 : 50; % x = t-mean
    format short
    disp('  ');
    disp('Just minimize the function F(s) = condest(vander(x/s))');
    F=@(s) condest(vander(x/s)); 
    sigma=std(t);
    minS = fminsearch(F,sigma);
    fprintf('A better value of σ is s = %.1f, where F(s) = %.0f \n',minS,F(minS));
    fprintf('Instead of sigma = %.1f, where F(sigma) = %.0f',sigma,F(sigma));
    disp('  ');

end

% il comando 'hline' plotta una riga orizzontale nella standard output.
