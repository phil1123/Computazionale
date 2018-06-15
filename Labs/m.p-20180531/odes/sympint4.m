function [q,p] = sympint4(q,p,dt,fa)

	x1 = 1/(2-2^(1/3));
	x0 = 1 - 2*x1;

	
	[q,p] = sympint2(q,p,x1*dt,fa);
	[q,p] = sympint2(q,p,x0*dt,fa);
	[q,p] = sympint2(q,p,x1*dt,fa);
	

	
