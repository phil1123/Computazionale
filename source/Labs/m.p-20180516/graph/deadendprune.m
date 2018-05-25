function Gp = deadendprune(G)
% Gp = deadendprune(G) prunes G by recursively removing all dead-end nodes
% so that Gp has no dead ends.

% make sure that no error is raised if G is undirected
if isa(G,'graph')
    Gp = G;
    return
end

s = find(G.outdegree > 0);
Gp = subgraph(G,s);
if length(s) < G.numnodes
    Gp = deadendprune(Gp);
end