function es_3_3

% Esercizio 3.3

% Le funzioni utilizzate sono nella cartella consegnata

    clear;clc;

% Definizione variabili 
    x = [-1.00 -0.96 -0.65 0.10 0.40 1.00];
    y = [-1.0000 -0.1512 0.3860 0.4802  0.8838 1.0000];

    u = [-1:0.01:1]; % asse x con incremento di 0.1

%--------------------------------------------------------------------------

% Parte a

    disp('(a) Interpolate these data by each of the four interpolants discussed');
    disp('in this chapter: piecelin, polyinterp, splinetx, and pchiptx.'); 
    disp('Plot the results for −1 ≤ x ≤ 1.');

% Interpolazioni
    interp_piecelin = piecelin(x,y,u);     %interpolazione lineare a pezzi
    interp_polyinterp = polyinterp(x,y,u); %interpolazione polinomiale
    interp_splinetx = splinetx(x,y,u);     %interpolazione spline
    interp_pchiptx = pchiptx(x,y,u);       %interpolazione pchip

% Plot
    hold on;                               %formattazione plot: pallini sui dati, interpolandi di colori differenti
    plot(x, y, 'o'); %dati
    plot(u, interp_piecelin, 'k-');        %interpolazione lineare a pezzi
    plot(u, interp_polyinterp, 'g-');      %interpolazione polinomiale
    plot(u, interp_splinetx, 'b-');        %interpolazione spline
    plot(u, interp_pchiptx, 'r-');         %interpolazione pchip

% Legenda
    legend('data','piecelin','polyinterp','splinetx', 'pchiptx', 'Location','southeast');
    hold off;
    hline;

%--------------------------------------------------------------------------

% Parte b

    disp('(b) What are the values of each of the four interpolants at x = −0.3? ');
    disp('Which of these values do you prefer? Why?');
    disp(' ');

%valori delle interpolanti a x=-0.3
    x0 = -0.3;
    k = find(u >= x0 , 1);                 %indice di u corrispondente al valore x0 voluto
    fprintf('I valori delle interpolanti a x = %f sono:\n',x0);
   
%valuta l'interpolante per x corrispondente alla posizione k-esima trovata
    fprintf('piecelin \ty= %f\t polyinterp \ty=%f\n',interp_piecelin(k),interp_polyinterp(k));
    fprintf('splinetx \ty= %f\t pchiptx \ty= %f \n\n', interp_splinetx(k), interp_pchiptx(k));

    disp('La differenza tra spline e pchip è: pchip conserva la forma dei punti');
    disp('mentre spline crea una curva con derivata seconda continua.');
    disp('Preferiamo utilizzare splinetx in quanto genera una curva più liscia');
    hline;

%--------------------------------------------------------------------------

% Parte c

    disp('(c) The data were actually generated from a low-degree polynomial with');
    disp('integer coefficients. What is that polynomial?');
    disp(' ');
    disp('Il polinomio da cui sono stati generati i numeri è: ');
    disp( '16 x^5 - 20 x^3 + 5 x');        % trovato "sperimentalmente"

end

% il comando 'hline' plotta una riga orizzontale nella standard output.
