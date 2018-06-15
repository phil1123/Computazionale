function moler_6_18

% Questo esercizio richiede di studiare l'integrale int(x^k*exp(x-1),0,1)
% al variare di k.

%% Parte a) Recursion formula
% Si chiede di mostrare che per l'integrale detto sopra esite una formula
% di ricorsione: E(k) = 1 - k*E(k-1) con E(0) = 1-1/exp(1).
% Si puo` dimostrare con carta e penna, integrando per parti 
% (e sarebbe meglio), oppure ricorrendo al calcolo simbolico 

disp('Valutazione simbolica:')
disp('E(k) =')

syms x k
assume(k > 0)
assume(x > 0)
Ek = int(x^k*exp(x-1),0,1);
disp(Ek)

E0 = subs(Ek,k,0);
chk = simplify(E0 - (1-exp(sym(-1))),'Steps',100);
disp(['E(0) - (1-1/e) = ' char(chk)])

Ekm1 = subs(Ek,k,k-1);
chk = simplify(Ek - (1-k*Ekm1),'Steps',100);
disp(['E(k) - (1-k*E(k-1)) = ' char(chk)])
% Il motore simbolico di MATLAB non ci arriva, usiamo vpa e vediamo
% che succede
for n = 1:20
    ns = num2str(n);
    nsm1 = num2str(n-1);
    chkn = vpa(subs(chk,k,n));
    disp(['E(' ns ') - (1-' ns '*E(' nsm1 ')) = ' char(chkn)])
end

disp('--- premere un tasto qualsiasi per continuare ---')
pause

%% Parte b)
% Si chiede di calcolare E(k), k = 1,...,20 con tre diversi metodi e
% valutare qual'e` il piu` veloce e quale il piu` accurato. I tre approcci sono:
% integrazione numerica per ogni k; forward recursion; backward recursion.
% Gli ultimi due metodi sfruttano la relazione di ricorsione stabilita
% nella parte precedente. La backward recursion in particolare parte da un
% valore inaccurato per E(32) e sostiutisce i valori a ritroso, tenendo poi
% solo quelli rilevanti.
% Per valutare l'accuratezza, confrontiamo i valori trovati da ciascun
% metodo con quelli calcolati con il pacchetto simbolico. Per la velocita`
% usiamo la funzione tic, toc di MATLAB.
% I metodi piu` veloci sono quelli di ricorsione, che fanno un piccolo 
% numero di semplici operazioni.
% I piu` accurati sono l'integrazione numerica e la backward recursion. 
% Infatti, mentre la forward recursion accumula errori di calcolo, 
% dovuti al roundoff amplificato dalla moltiplicazione per k, il metodo 
% backward, grazie alla divisione per k riduce il roundoff.
% Su osservi che il metodo di backward substitution e` piu` accurato 
% di quadtx con tol = 1.e-10.

disp(' ')
disp('Valutazione numerica in vpa(32):')
E = sym(zeros(20,1));
for n = 1:20
    ns = num2str(n);
    E(n) = vpa(subs(Ek,k,n));
    disp(['E(' ns ') = ' char(E(n))])
end


disp('--- premere un tasto qualsiasi per continuare ---')
pause
disp(' ')
disp('Integrazione numerica con quadtx:')
E1 = zeros(20,1);
tic
% ripetiamo il procedimento per avere una buona stima del tempo impiegato
for i = 1:100
    for k = 1:20
        E1(k) = quadtx(@(x,k)x^k*exp(x-1),0,1,1.e-10,k);
    end
end
t1 = toc/100;

disp('Tempo impiegato:')
disp(t1)
disp('Errore:')
[(1:n)' E1 - double(E)] %#ok<NOPRT>

disp('--- premere un tasto qualsiasi per continuare ---')
pause
disp(' ')
disp('Forward Recursion:')

E2 = zeros(21,1);
E2(1) = 1-1/exp(1);
tic
for i = 1:100
    for k = 1:2
        E2(k+1) = 1-k*(E2(k));
    end
end
t2 = toc/100;

disp('Tempo impiegato:')
disp(t2)
disp('Errore:')
[(1:n)' E2(2:21) - double(E)] %#ok<NOPRT>

disp(norm(E2(2:21) - double(E),inf))

disp('--- premere un tasto qualsiasi per continuare ---')
pause
disp(' ')
disp('Backward Recursion:')

E3 = zeros(32,1);
E3(32) = 0; % inaccurate value for starting
tic
for i = 1:100
    for k = 32:-1:2
        E3(k-1) = (1-E3(k))/k;
    end
end
t3 = toc/100;

disp('Tempo impiegato:')
disp(t3)
disp('Errore:')
[(1:n)' E3(1:20) - double(E)] %#ok<NOPRT>