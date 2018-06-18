function psi = psi_wp( x, x0, a )
% PSI_WP Return a vector of a GAUSSIAN WAVEPOCKET in x traslate by x0, and
% properly normalized in a interval where the points are spaced by a.
    psi = exp(-(x - x0).^2);
    % Normalize it
    psi = psi/(sqrt(a)*norm(psi));
end

