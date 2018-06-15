function x = mypagerank(G,p)
% PAGERANK  Google's PageRank
% pagerank(G,p) uses the digraph G produced by SURFER,
% together with a damping factory p, (default is .85), to compute and plot
% a bar graph of page rank, and print the dominant URLs in page rank order.
% x = pagerank(G,p) returns the page ranks instead of printing.
% See also MYSURFER, SPY.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

%%%% very minor modifications

if nargin < 2, p = .85; end

% Eliminate any self-referential links

U = G.Nodes.Name;
G = G.adjacency;
G = G' - diag(diag(G));  % notice the prime!
  
% c = out-degree, r = in-degree

[~,n] = size(G);
c = sum(G,1);
r = sum(G,2);

% Scale column sums to be 1 (or 0 where there are no out links).

k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);

% Solve (I - p*G*D)*x = e

e = ones(n,1);
I = speye(n,n);
x = (I - p*G*D)\e;

% Normalize so that sum(x) == 1.

x = x/sum(x);

% Bar graph of page rank.

shg
bar(x)
title('Page Rank')

% Print URLs in page rank order.

if nargout < 1
    [~,q] = sort(-x);
    disp('     page-rank  in  out  url')
    k = 1;
    while (k <= n) && (x(q(k)) >= .005)
        j = q(k);
        fprintf(' %3.0f %8.4f %4.0f %4.0f  %s \n', ...
            j,x(j),full(r(j)),full(c(j)),U{j})
        k = k+1;
    end
end
