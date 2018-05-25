

%% -----------------------------script BISEZIONE (copia moler)
M = 2;
a = 1;
b = 2;
k = 0;
while b-a > eps
    x = (a + b)/2;
    fprintf('%1.15f\n', x); %%EDIT
% sprintf restituisce le variabili in una stringa ANS, fprintf le restituisce nello STANDARD OUTPUT
% RICORDA i punti e virgola ; negli statements dei programmi sennò lui pensa che siano variabili
    if x^2 > M
		    b = x;
	else
		    a = x;
    end
    k = k + 1;
end



%%----------------------------------------SCRIPT BISEZIONE di MATLAB
k = 0;
while abs(b-a) > eps*abs(b)
	% BISEZIONE: while abs(b-a) > eps*abs(b)
	% usa eps*abs(b) perchè i float sono distribuiti in logscale, quindi è meglio usare l'err relativo
	x = (a + b)/2;
	if sign(f(x)) == sign(f(b))
		b = x;
		else
		a = x;
	end
	k = k + 1;
end

%%--------------------------------------------FUNZIONE BISEZIONE scritta da noi
function [x,k] = bisect(f,ab,b)
kmax = 100;
narginchk(2,3)
    a = ab(1);
if nargin == 2
    b = ab(2);
    k = 0;
end

while abs(b-a) > eps*abs(b) && k < kmax
    x = (a + b)/2;
    if sign(f(x)) == sign(f(b))
        %devo considerare anche se uno dei due è zero
        b = x;
    else
        a = x;
    end
    k = k + 1;
end



