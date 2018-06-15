function [rv,vv,En,Lv,Nv] = keplerode(t,rv,vv,odesolver,tol)
% [rv,vv] = kepler(t,rv,vv) computes evolution along Kepler orbits,
% by directly solving the eqs. of motion with ode45.
% [rv,vv] = kepler(t,rv,vv,odesolver) does the same with an explicitly
% selected MATLAB ode solver.
% rv and vv are 1x3 row arrays (vectors in a Cartesian system over R^3);
% t is a column array with the evolution time points;
% units are such that G*M = 1.
% [rv,vv,En,Lv,Nv] = kepler(...) returns also the approximately conserved 
% quantities.

narginchk(3,5)
if nargin < 4
    odesolver = @ode45;
end
if nargin < 5
    tol = [1e-6 1e-6];
end
if isscalar(t)
    t = [0 t];
end
option = odeset('abstol',tol(1),'reltol',tol(2));

GM = 1;

y0 = [rv'; vv'];
% y0 = zeros(6,1);
% y0(1:3) = rv;
% y0(4:6) = vv;
[~,y] = odesolver(@twobody,t,y0,option);
rv = y(:,1:3);
vv = y(:,4:6);

if nargout > 2
    rr = sqrt(sum(rv.^2,2));
    En = 0.5*sum(vv.^2,2) - 1./rr;
end
if nargout > 3
    Lv = cross(rv,vv,2);
end
if nargout > 4
    Nv = cross(vv,Lv,2) - rv./(rr*ones(1,3));
end

% nested function

    function ydot = twobody(~,y)
        r = sqrt(sum(y(1:3).^2));
        ydot = [y(4:6); -GM*y(1:3)/r^3];
    end

end

