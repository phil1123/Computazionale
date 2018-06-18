function r = check_V( V, MIN, MAX, N, tau )
%CHECK_V Check if the potential can be used in the algorithm of the
%evolution of psi, return 1 if it can be used else 0.

% In the algorithm there is a part in which the program has to calculate
% this quantity: exp(-1i*tau*V(x)/2).
% Where x is in the interval [MIN MAX] = I, so I is a compact subset in R,
% also the function V must be a continuos function so it has for Weistrass
% two value xm, xM in I which V(xm) = m = inf(V(x)) in I and the same for
% xM where V(xM) = M = sup(V(x)).
% Made this premise, there is a problem in the algorithm if there is a x1
% in I, x1 != x, for which exp(-1i*tau*V(x)/2) = exp(-1i*tau*V(x1)/2).
% To have this situation must be:

% V(x1) = V(x) +/- 4pi/tau = V(x) +/- k(tau)

% For tau = 0.01, k ~ 1256.
% Since the assumptions made above, f(I) is in [m M], to check that the
% potential can be used the function has to valuate if, one of these 
% inequalities are false:

% M - k > m
% m + k < M

    % Recreate the interval
    x = linspace(MIN, MAX, N);

    k = 4*pi/tau;
    M = max(V(x));
    m = min(V(x));

    if M - k > m || m + k < M
        r = 0;
    else
        r = 1;
    end
end

