%-- 26/04/2018 09:34 --%
g=digraph([1 2 2 3 3 4 5],[2 3 4 4 5 5 1],rand(1,7))
g.Edges
plot(g)
g=digraph([1 1 2 2 3 3 4 5],[2 3 3 4 4 5 5 1],rand(1,8))
plot(g)
g.adjacency
g.Edges
w0=graph2stoch(g)
[u,e]=eig(full(w0));
diag(e)
u(:,1)
u0=u(:,1)/sum(u(:,1))
[u,e]=eig(full(w0));
size(e)
isdiag(e)
e(1)
abs(diag(e))
u0=u(:,1)/sum(u(:,1))
[mc,f,w,w2]=markovchain(g,1e6);
[f u0]
format longG
[f u0]
format shortG
w-w0
mc(1:100)
v=repmat(w,[1 1 5]);
v(:,:,1)
w
v(:,:,2)
v=repmat(w,[1 1 5]);
vp=permute(v,[3 1 2]);
v(1,:,:)
squeeze(v(1,:,:))
squeeze(vp(1,:,:))
w
nnz(w2-v.*vp)
d=w2-v.*vp;
d(d~=0)
g=digraph([1 1 2 2 3 3 4 5],[2 3 3 4 4 5 5 1],rand(1,8))
g=digraph([1 1 2 2 3 3 4 5 6],[2 3 3 4 4 5 5 1 2],rand(1,9))
plot(g)
open surfer
help webread
[U,G]=surfer('http://www.unimib.it',10)
[U,G]=surfer('https://www.unimib.it',10)
g=digraph(G',U)
g.Edges
plot(g)
[U,G]=surfer('https://www.unimib.it',30)
g=digraph(G',U)
clf
plot(g)
load harvard500
size(U)
size(G)
g=digraph(G',U)
U{1:20}
U(1:20)
g.Nodes(1:20)
g.Nodes
g.Nodes(1:20)
j=1:20;
g.Nodes(j)
g.Nodes(1)
g.Nodes{1}
class(g.Nodes)
g.Nodes.Row
g.Nodes.Name
g.Nodes.Name(1:20)
plot(g)
spy(G)
plot(g)
spy(G)
spy(G^2)
spy(G^3)
spy(G^4)
spy(G^6)
spy(G^8)
spy(G^9)
cc=conncomp(g,'OutputForm','cell')
cc=conncomp(g,'OutputForm','cell');
cc=conncomp(g);
length(cc)
g=deadendprune(g)
g=digraph(G',U)
g=deadendprune(g)
cc=conncomp(g,'OutputForm','cell');
length(cc)
cc{1}'
cc{2}'
cc{3}'
cc{4}'
cc{5}'
clear
symcircuit
