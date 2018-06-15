function S = graph2stoch(G,pjump)
% S = graph2stoch(G) extracts the stochastic matrix, in sparse format,
% which corresponds to the (directed or indirected), possibly link-weighted
% graph G, from which all nodes without out-links (dead ends) and all the
% corresponding in-links are first removed;
% S = graph2stoch(G,pjump) does not remove nodes or links but instead
% proceeds as follows:
%   1. if pjump = -1, self-links are added to dead ends;
%   2. if pjump is a numerical scalar and 0 <= pjump <= 1, the stochastic
%      matrix S allows for jumps to a randomly chosen node with probability 
%      pjump from non dead-end nodes and with probability 1 from 
%      dead-end nodes.

narginchk(1,2);

% make G directed if not
if isa(G,'graph')
   G = graph2digraph(G); 
end

p = 1;
if nargin < 2
    G = deadendprune(G);
    pjump = -2;
elseif isnumeric(pjump) && isscalar(pjump)
    if pjump > 1 || (pjump < 0 && pjump ~= -1)
        error('second input must be -1 or a probability')
    elseif pjump >= 0
        p = 1 - pjump;
    end
else
    error('second input must be a numerical scalar')
end

try
    w = table2array(G.Edges);
    s = w(:,1);
    e = w(:,2);
    w = w(:,3);
catch
    s = findnode(G,G.Edges.EndNodes(:,1));
    e = findnode(G,G.Edges.EndNodes(:,2));
    w = G.Edges.Weight;
end

n = G.numnodes;
for j = 1:n
   I = s == j;
   nj = nnz(I);
   if nj > 0
       w(I) = p*w(I)/sum(w(I)) + (1-p)/n;
       if nj < n && pjump >= 0
           s(end+(1:n-nj)) = j*ones(n-nj,1);
           e(end+(1:n-nj)) = setdiff((1:n)',e(I));
           w(end+(1:n-nj)) = ((1-p)/n)*ones(n-nj,1);
       end
   else
       if pjump == -1 % add self-link
           s = [s; j]; %#ok<*AGROW>
           e = [e; j];
           w = [w; 1];
       else
           s = [s; j*ones(n,1)];
           e = [e; (1:n)'];
           w = [w; (1/n)*ones(n,1)];
       end
   end    
end

S = sparse(s,e,w)';

