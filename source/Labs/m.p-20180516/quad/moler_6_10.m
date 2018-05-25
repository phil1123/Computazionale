function es6_10
% Esercizio 6.10

% L'esercizio richiede di effettuare l'integrazione numerica di x*sin(1/x)
% tra 0 e 1 e poi di controllare il valore così ottenuto con quello trovato
% con il pacchetto simbolico.

%% Parte a) Plotting

disp('Function plotting:')
f = @(x) x.*sin(1./x);
fplot(f,[0 1])

disp('--- premere un tasto qualsiasi per continuare ---')
pause

%% Parte b) Symbolic computation

disp('Exact value:')
syms x
h = x*sin(1/x);
D = int(h,0,1);
format long
disp(vpa(D,64))

disp('--- premere un tasto qualsiasi per continuare ---')
pause

%% Parte c) quadtx computation
% quadtx non riesce a portare a termine l'integrazione, perchè incontra un
% espressione 1/0 a uno degli estremi.

disp('quadtx error message:')
try
    quadtx(f,0,1)
catch error
    fprintf(2,[error.message '\n'])
end

disp('--- premere un tasto qualsiasi per continuare ---')
pause

%% Parte d) Solutione
% Per risolvere questo problema possiamo spostare di poco l'estremo
% d'integrazione sinistro e calcolare nuovamente l'integrale.
% Controlliamo poi in un ciclo che l'errore sul calcolo diminuisca se la
% tolleranza viene diminuita.

disp('Shifting-end solution: Difference with symbolic computation plotted')
disp('versus tolerance:')

for k = 1:12
        tol(k) = 10^(-k); %#ok<AGROW>
        [Q,~] = quadtx(f,eps,1,tol(k));
        err(k) = Q - eval(D); %#ok<AGROW>
end

loglog(tol,abs(err),'-*')
title('Error vs Tolerance')
xlabel('tolerance')
ylabel('error')
