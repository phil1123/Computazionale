function [L,U,p] = mylutx(A)
%LUTX  Triangular factorization, textbook version
%   [L,U,p] = lutx(A) produces a unit lower triangular matrix L,
%   an upper triangular matrix U, and a permutation vector p,
%   so that L*U = A(p,:)

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

% CONTROLLO SE LA MATRICE È QUADRATA
[nr,nc] = size(A);
if nr ~= nc %~= non uguale
    error('input must be a square matrix!')
end
n = nr;
p = (1:n)';

for k = 1:n-1

   % Find index of largest element below diagonal in k-th column
   [~,m] = max(abs(A(k:n,k)));
   m = m+k-1; %SPOSTAMENTO POSIZIONE DEL VETTORE ABS() SOPRA (IMPORTANTE vedi diary)

   % Skip elimination if column is zero
   if (A(m,k) ~= 0)
   
      % Swap pivot row
      if (m ~= k)
          A([k m],:) = A([m k],:); %PERMUTAZIONE DI DUE RIGHE
         p([k m]) = p([m k]);
      end

      % Compute multipliers
      i = k+1:n;
      A(i,k) = A(i,k)/A(k,k);

      % Update the remainder of the matrix
      j = k+1:n;
      A(i,j) = A(i,j) - A(i,k)*A(k,j); 
   end
end

% Separate result
L = tril(A,-1) + eye(n,n);
U = triu(A);
