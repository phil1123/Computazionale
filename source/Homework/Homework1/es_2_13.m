function es_2_13

% Es. 2.13 

clear;clc;

%(a) Why is an interesting example?
%   M = magic(8)
%   lugui(M)Exercises

    disp('(a) With n = 8 = 4m the magic matrix is doubly even and has rank = 3.');
    disp('Elimination with exact arithmetic would produce a U matrix with just');
    disp('three pivots different from zero.');
    hline;

%--------------------------------------------------------------------------------

%(b) How is the behavior of lugui(M) related to rank(M)?

    disp('(b) The behaviour of lugui with singular square matrixes (rank < dim)');
    disp('is critical because of the roundoff errors and consequent division ');
    disp('by small pivots: where exact arithmetic would produce a zero, ');
    disp('roundoff error may produce close to eps numbers that propagates'); 
    disp('starting from the (dim - rank) iteration of the gaussian elimination algorithm.');
    disp('NOTE: that this may happen also with full ranked if they are nearly singular.');
    hline;

%--------------------------------------------------------------------------------

%(c) Can you pick a sequence of pivots so that no roundoff error occurs in lugui(M)?

    disp('(c) No, it is not possible, becuase of the singularity of the matrix.');

end

% il comando 'hline' plotta una riga orizzontale nella standard output.
