function [L,U,p,sig] = lutxSig(A)
%LU Triangular factorization
% [L,U,p,sig] = lutxSig(A) computes a unit lower triangular
% matrix L, an upper triangular matrix U, a permutation
% vector p, and a scalar sig, so that L*U = A(p,:) and
% sig = +1 or -1 if p is an even or odd permutation.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

[n,n] = size(A);
p = (1:n)';


%% MODIFICA PER CONTEGGIO TRASPOSIZIONI

sig = 1;

% funziona come un toggle-switch: ad ogni trasposizione eseguita
% nel blocco delle righe 33-38, sig viene cambiata di segno


for k = 1:n-1

   % Find index of largest element below diagonal in k-th column
   [r,m] = max(abs(A(k:n,k)));
   m = m+k-1;

   % Skip elimination if column is zero
   if (A(m,k) ~= 0)
   
      % Swap pivot row
      if (m ~= k)
         A([k m],:) = A([m k],:);
         p([k m]) = p([m k]);
         sig = -sig;
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



