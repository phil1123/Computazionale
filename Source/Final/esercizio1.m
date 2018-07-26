%% Prima parte
L = 100;
N = 2000;

x = linspace(-L,L,N)';  

% potenziale
b = 4;
V = stepfunction(x,b);
V0 = 4/b^2;

% coefficienti trasmissione
[k,T] = tr_coefficient(x,V);        % numerico
analyticT = transmission(k,V0,2*b); % teorico

% plot
plot(k,[T analyticT])
legend('Numerico','Analitico'); 
title('Confronto trasmissione barriera quadrata');
xlim([0 10])
xlabel('k')
ylabel('Coefficiente trasmissione')


%% Seconda parte
L = 1000;
N = 2000;

x = linspace(-L,L,N)'; 

% Gaussiano
x0 = 0;
sigma = 1;
V0 = 1;
V = V0.*exp(-(x-x0).^2./sigma.^2);


[k,T] = tr_coefficient(x,V);        % numerico

plot(k,T)
legend('Numerico','Analitico'); 
title('Confronto trasmissione barriera quadrata');
xlim([0 10])
xlabel('k')
ylabel('Coefficiente trasmissione')

%%
wavepackets(x,V)

% Scalino
b = 10;
V0 = 0.5;

V = stepfunction(x,b,V0);
