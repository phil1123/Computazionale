function es_4_11

% Es 4.11

clear; clc;

%-------------------------------------------------------------------------

    disp('(a) What is the largest value of n for which Γ(n + 1) and n! can be') 
    disp('exactly represented by a double-precision floating-point number?')

    str = '\nIl più alto numero intero esattamente rappresentabile è %d \n';
    fprintf(str,flintmax);
    str = 'Quindi, il più grande n per cui n! < %d è: n = %d \n';
    n = 18;

    fprintf(str,flintmax, n);
    str = 'Poichè: \n %d \t<\t %d \t<\t %d\n ';
    fprintf(str, gamma(n+1), flintmax, gamma(n+2));
    fprintf(' gamma(n+1) \t\t< \t max rappresentabile \t<\t gamma(n+2)');

    hline;
    
%--------------------------------------------------------------------------

    disp('(b) What is the largest value of n for which Γ(n + 1) and n! can be');
    disp('approximately represented by a double-precision floating-point ');
    disp('that does not overflow?');
    n = 170;
    str = '\nIl numero n più grande approssimabile in floating point è: %d\n';
    fprintf(str,n);
    str = 'Poichè gamma(n+1) = %d e gamma(n+2) = %d';
    fprintf(str,gamma(n+1),gamma(n+2));
    hline;
   
end
