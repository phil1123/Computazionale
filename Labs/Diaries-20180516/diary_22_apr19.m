%-- 04/19/2018 09:40:57 PM --%
g=digraph
methods(g)
help findnode
plot(g)
g=digraph([1 2 3 4],[2 3 4 1])
plot(g)
g=digraph([1 2 2 3 4],[2 3 4 4 1])
plot(g)
g=graph([1 2 2 3 4],[2 3 4 4 1])
plot(g)
A=g.adjacency
g=digraph(A)
plot(g)
g.rmedge(4,1); plot(g)
g=g.rmedge(4,1); plot(g)
g=g.rmedge(2,3); plot(g)
g=g.addedge(3,1); plot(g)
g=g.addedge(3,1,1); plot(g)
g=g.rmedge(2,4); plot(g)
g=g.rmedge(4,2); plot(g)
rwalkongraph(g)
open rwalkongraph.m
open markovchain.m
rwalkongraph(g,0.5)
