function dG = graph2digraph(G)

if isa(G,'digraph')
   dG = G;
   return
end
n = numnodes(G);
[s,t] = findedge(G);
A = sparse(s,t,G.Edges.Weight,n,n);
A = A + A.' - diag(diag(A));
dG = digraph(A);
dG.Nodes = G.Nodes;

