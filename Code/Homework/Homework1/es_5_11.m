function es_5_11

%Esercizio 5.11

clear; clc;

% Dataset set up
% load data and add one column for the constant term

load longley.dat;
fprintf( '\n Data loaded.\n');
y = longley(:,1);
X = [ ones(size(y,1),1) longley(:,2:7)];
fprintf( '\n Added 1-column.\n');


% Data Structures of labels and all their couples:
% this is used in point (d) to automatically print out
% the highly correlated couples of variables.
% % The structured will be indexed by a boolean matrix
% % where true in the (i,j) cell indicate a hihly correlated couple
% % of variables.
s(6,6) = struct('label', [], 'data', []);
    s(1,1).label = 'GNPdefl';
    s(2,2).label = 'GNP'; 
    s(3,3).label = 'Unemployed';
    s(4,4).label = 'ArmedForces';
    s(5,5).label = 'Population';
    s(6,6).label = 'Year';

for ( i = [1:6] )
    for ( j = [1:6] )
        
        % generates variables couples
        if ( i ~=j ) s(i,j).label = [ ' ' s(i,i).label '+' s(j,j).label ' '];
        end
        
        % inserts in the main diagonal data & skips first column - ( intercept )
        if ( i == j ) s(i,i).data = X(:,1+i);
        end
    end
end

fprintf( '\n Matrix of labels generated.\n');


% (a) Estimation step

beta = (X\y); % LSQ estimators
fprintf( '\n Estimated LSQ betas: '); beta

    
% (b) comparison with reference values

% https://rstudio-pubs-static.s3.amazonaws.com/269760_abe16b38acec471e92021b0ee703efd8.html
% Coefficients:
%                Estimate Std. Error t value Pr(>|t|)    
% (Intercept)  -3.482e+06  8.904e+02  -3.911 0.003560 ** 
% GNP.deflator      15.06  8.492e-02   0.177 0.863141    
% GNP          -3.582e-02  3.349e-02  -1.070 0.312681    
% Unemployed       -2.020  4.884e-03  -4.136 0.002535 ** 
% Armed.Forces     -1.033  2.143e-03  -4.822 0.000944 ***
% Population   -5.110e-02  2.261e-01  -0.226 0.826212    
% Year          1.829e+00  4.555e-01   4.016 0.003037 ** 

betaRef  = [ -3.482e+06 ; 15.06 ; -3.582e-02 ; -2.020 ; -1.033 ; -5.110e-02 ; 1829 ];

norm1 = norm(beta-betaRef,1);
fprintf( '\n The 1-norm difference is: ' ); norm1
fprintf( '\n');


% (c) Graphical step

yExpe  = X*beta;        % expected values
yRefe  = y;             % reference values
res = (yRefe - yExpe);  % linear model residuals
years   = [ 1 : 16 ]';

subplot(2, 1, 1), errorbar(years,  yExpe, abs(res), '.' ); hold on;

subplot(2, 1, 1), legend( 'yExpected+-residual' );


% (d) Correlation matrix

x = X(:,2:end); % exclude constant

corrCoeff = corrcoef(x);

% select couples of highly correlated variables
    treshold = 0.75;
    selectionMatrix = tril( (abs(corrCoeff) >= treshold) - eye(size(corrCoeff,1)) );

    fprintf( '\n');
    highlyCorrelated = [ s(logical(selectionMatrix)).label ]
    fprintf( '\n');


% (e) Normalization

y = y - mean(y);
y = y/std(y);

subplot(2, 1, 2), p = plot(y);
colorArray = [ 'g' 'r' 'c' 'm' 'b' 'k'];

for i=1:6
    
    % data are in the main diagonal of struct array
    s(i,i).data = s(i,i).data - mean(s(i,i).data);
    s(i,i).data = s(i,i).data/std(s(i,i).data);
    
    % add to plot
    subplot(2, 1, 2), plot(s(i,i).data, 'Color', colorArray(i) ); hold on;
    
end

subplot(2, 1, 2), legend(  s(1,1).label, s(2,2).label, s(3,3).label, s(4,4).label, s(5,5).label, s(6,6).label );

end

