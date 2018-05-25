function q = cnoidal(t,q0)

m = q0^2/(1+q0^2)/2;
[~,cn] = ellipj(t*sqrt(1+q0^2),m);
q = q0*cn;