function es_4_15

%Esercizio 4.15

clear;clc;

    disp('M = E − e sin E for this exercise, take M = 24.851090 and e = 0.1.');
    disp(' ');
    disp('(a) Use fzerotx to solve for E. You can assign the appropriate values to M');
    disp('and e and then use them in the definition of a function of E.');
    format long;

%Variabili
    M = 24.851090; e = 0.1;

% Funzione
    F = @(E) E - e*sin(E) - M;
    E = fzerotx(F,[0 100]) % zero di F

    hline;

%--------------------------------------------------------------------------

    disp('(b) An “exact” formula for E is known. ');
    disp('Jm (x) is the Bessel function of the first kind of order m. ');
    disp('Use this formula, and besselj(m,x) in Matlab, to compute E. ');
    disp('How many terms are needed? ');

    disp(' ');
    disp('Dopo 14 termini della serie, le differenze con i termini successivi');
    disp('diventano inferiori alla precisione, quindi non apprezzabili');
    n = 14;

    fprintf('\nE \t=\t\t%.48f \n',E);
    fprintf('Serie %d°ordine = \t%.48f\n',n-1,En(n-1,e,M));
    fprintf('Serie %d°ordine = \t%.48f\n',n,En(n,e,M));
    fprintf('Serie %d°ordine = \t%.48f\n',n+1,En(n+1,e,M));

    disp(' ');
    disp('How does this value of E compare to the value obtained with fzerotx?');
    disp(' ');
    disp('E calcolato con fzerotx approssima il valore vero');
    disp('con una precisione non inferiore a');

    error = E-En(n,e,M)
    format;

%--------------------------------------------------------------------------

% Somme parziali dell serie
    function x = En(n,e,M)
    x = M;
        for i=1:n
            x = x + 2/i*besselj(i,i*e)*sin(i*M);
        end
    end

end
