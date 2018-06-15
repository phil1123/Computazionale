function determ = mydet(A)
% calcolo del determinante con gli output della funzione
% [L,U,p,sig] = lutxSig(A)


[L,U,p,sig] = lutxSig(A);
determ = prod(diag(U)) * sig;
