%-- 23/04/2018 09:37 --%
w=rand(6)
w=w./(ones(6,1)*sum(w))
sum(w)
g=digraph(w)
g.Edges
plot(g)
w=rand(6)
w=w(w>1/2)
w=rand(6)
W(w<1/2)=0
w=rand(6)
w(w<1/2)=0
w=w./(ones(6,1)*sum(w))
g=digraph(w)
plot(g)
methods(g)
g.adjacency
g.Edges
w
[u,e]=eig(w)
diag(E)
diag(e)
format longG
diag(e)
diag(abs(e))
w^10
format shortG
w^10
w^100
u0=ans(:,1)
w*u0
norm(w*u0-u0)
w^100
[mc,f]=markovchain(g,1e4);
f
u0
[u,e]=eig(w')
[u,e]=eig(w');
diag(abs(e))
u(:,1)
u(1,:)
u0=u(1,:)
u0=u0'
u0=u0/sum(u0)
g=digraph(w')
plot(g)
[mc,f]=markovchain(g,1e4);
w^100
u0=ans(:,1)
f
g=digraph(w)
[mc,f]=markovchain(g,1e4);
f
[f u0]
g=digraph(w')
[mc,f]=markovchain(g,1e4);
[f u0]
[mc,f]=markovchain(g,1e5);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
g.Edges.EndNodes
g.findnode(g.Edges.EndNodes(:,1))
g.findnode(g.Edges.EndNodes(:,2))
[mc,f]=markovchain(g,1e6);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
[mc,f]=markovchain(g,1e6);
[f u0]
n=6;
f2
w'
f
norm(ww-w')
ww
w'
ww-w'
[mc,f]=markovchain(g,1e6);
ww-w'
w'
f2
sum(f2)
f2
sum(f2)