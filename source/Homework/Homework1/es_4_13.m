function es_4_13

% Esercizio 4.13

clear;clc;

    disp('(a) Write a Matlab function gammalninv that evaluates this function');
    disp('for any x. That is, given x, y = gammalninv(x) computes y so that');
    disp('gammaln(y) is equal to x.');
    disp(' ');
    disp('VEDI CODICE');
    hline;

%-------------------------------------------------------------------------

    disp('(b) What are the appropriate ranges of x and y for this function?');
    disp(' ');
    disp('I domini appropriati per x e y sono (0,+Inf) in quanto la gamma è');
    disp('singolare nei numeri interi negativi e in zero e il logaritmo non è');
    disp('definito in zero');

function y = gammalninv(x)
% GAMMALNINV computes the inverse gamma function.

    f = @(y) gammaln(y) - x;
    fzerotx(f,[0 10]);

end

end
