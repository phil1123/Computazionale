function y = gammalninv(x)
%% Esercizio 4.13

%(a) Write a Matlab function gammalninv that evaluates this function for
%any x. That is, given x, y = gammalninv(x) computes y so that 
%gammaln(y) is equal to x.

% Dato x (argomento) cerco gli zeri (in y) di Gammaln(y)-x
    f = @(y) gammaln(y) - x;
    y = fzerotx(f,[0 4]); %fzero introduce un roundoff error

end

%-------------------------------------------------------------------------

%(b) What are the appropriate ranges of x and y for this function?

% I domini appropriati per x e y sono (0,+Inf) in quanto la gamma è
% singolare nei numeri interi negativi e in zero e il logaritmo non è
% definito in zero