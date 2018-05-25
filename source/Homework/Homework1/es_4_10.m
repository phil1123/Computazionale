function es_4_10

% Esercizio 4.10

clear; clc;

%--------------------------------------------------------------------------

    disp('(a) Compute the first ten zeros of J0(x).');
    step = pi/50;
    x = 0:step:10*pi; %asse x

    J0 = @(x) besselj(0,x); %funzione bessel J0

    for n = 1:10
    zeroJ0(n) = fzerotx(J0,[(n-1) n]*pi);
    end

    zeroJ0

    hline;

%--------------------------------------------------------------------------

    disp('(b) Compute the first ten zeros of Y0(x), ')
    disp('the zeroth-order Bessel function of the second kind.')

    Y0 = @(x) bessely(0,x);

    for n = 1:10
    zeroY0(n) = fzerotx(Y0,[(n-1) n]*pi);
    end
    zeroY0

    hline;

%--------------------------------------------------------------------------

    disp('(c) Compute all the values of x between 0 and 10π for which J0(x) = Y0(x)');

    W0 = @(x)Y0(x)-J0(x);
    disp('Sia W0 = Y0 - J0');
    for n = 1:10
    zeroW0(n) = fzerotx(W0,[(n-1) n]*pi);
    end
    zeroW0

    hline;

%---------------------------------------------------------------------------

    disp('(d) Make a composite plot showing J 0 (x) and Y 0 (x) for 0 ≤ x ≤ 10π,');
    disp('the first ten zeros of both functions, and the points of intersection.');
    disp('');

    y = J0(x);
    J = plot(x,y,'k-', zeroJ0,zeros(1,10),'ko'); %plot funzioneJ0 e zeri
    hold on;
    line([0 10*pi],[0 0],'color','black');
    xlim([0 10*pi]); ylim([-0.5 1.0]); % dominio assi

    y = Y0(x);
    Y = plot(x,y,'b-', zeroY0,zeros(1,10),'bo');

    y = W0(x);
    W = plot(zeroW0,Y0(zeroW0),'ro');

    %Legenda
    legend([J;Y;W],'Funzione J0(x)','zeri J0','Funzione Y0(x)','zeri Y0','Punti intersezione');

%--------------------------------------------------------------------------

end
