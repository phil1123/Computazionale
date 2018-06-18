function L = lap1D( N, a )
% LAP1D Create the Laplacian in N dimension with space between two points
% of 'a', it create the Laplacian matrix in the tridiagonal form.
    D = sparse(1:N, 1:N,-2*ones(1,N),N,N);
    E = sparse(2:N,1:N-1,ones(1,N-1),N,N);
    L = E+D+E';
    
    L = L/a^2;
end

